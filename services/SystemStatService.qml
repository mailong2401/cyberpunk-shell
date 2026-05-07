pragma Singleton
import QtQuick
import Quickshell.Io
import Quickshell

Singleton {
  id: root
  property list<real> coresUsage: []
  property var prevCpuCoresStats: null
  property var prevCpuStats: null
  property real cpuUsage: 0
  property int cpuHistoryLength: 60
  property var cpuHistory: new Array(cpuHistoryLength).fill(0)
  readonly property int diskHistoryLength: Math.max(10, Math.ceil(historyDurationMs / diskIntervalMs))
  readonly property int historyDurationMs: (1 * 60 * 1000) // 1 minute
  property real memGb: 0
  property int memPercent: 0
  property real memTotalGb: 0

  property int zfsArcSizeKb: 0
  property int zfsArcCminKb: 0
  property real swapGb: 0
  property int swapPercent: 0
  property real swapTotalGb: 0

  property var diskPercents: ({})
  property var diskAvailPercents: ({}) // available disk space in percent
  property var diskUsedGb: ({}) // Used space in GB per mount point
  property var diskAvailableGb: ({}) // available space in GB per mount point
  property var diskSizeGb: ({}) // Total size in GB per mount point
  property var diskHistories: ({})

  property int memHistoryLength: 60
  property var memHistory: new Array(memHistoryLength).fill(0)
  property var _registered: ({})
  readonly property bool shouldRun: _registeredCount > 0
  readonly property int _registeredCount: Object.keys(_registered).length

  readonly property int diskIntervalMs: 30000

  function registerComponent(componentId) {
    root._registered[componentId] = true;
    root._registered = Object.assign({}, root._registered);
    Logger.d("SystemStat", "Component registered:", componentId, "- total:", root._registeredCount);
  }

  function unregisterComponent(componentId) {
    delete root._registered[componentId];
    root._registered = Object.assign({}, root._registered);
    Logger.d("SystemStat", "Component unregistered:", componentId, "- total:", root._registeredCount);
  }

  onShouldRunChanged: {
    if (shouldRun) {
      if (!dfShell.running) {
        dfShell.running = true
      }
    } else {
      if (dfShell.running) {
        dfShell.running = false
      }
    }
  }

  function parseMemoryInfo(text) {
    if (!text)
    return;
    const lines = text.split('\n');
    let memTotal = 0;
    let memAvailable = 0;
    let swapTotal = 0;
    let swapFree = 0;

    for (const line of lines) {
      if (line.startsWith('MemTotal:')) {
        memTotal = parseInt(line.split(/\s+/)[1]) || 0;
      } else if (line.startsWith('MemAvailable:')) {
        memAvailable = parseInt(line.split(/\s+/)[1]) || 0;
      } else if (line.startsWith('SwapTotal:')) {
        swapTotal = parseInt(line.split(/\s+/)[1]) || 0;
      } else if (line.startsWith('SwapFree:')) {
        swapFree = parseInt(line.split(/\s+/)[1]) || 0;
      }
    }

    if (memTotal > 0) {
      // Calculate usage, adjusting for ZFS ARC cache if present
      let usageKb = memTotal - memAvailable;
      if (root.zfsArcSizeKb > 0) {
        usageKb = Math.max(0, usageKb - root.zfsArcSizeKb + root.zfsArcCminKb);
      }
      root.memGb = (usageKb / 1048576).toFixed(1); // 1024*1024 = 1048576
      root.memPercent = Math.round((usageKb / memTotal) * 100);
      root.memTotalGb = (memTotal / 1048576).toFixed(1);
      root.pushMemHistory();
    }

    // Swap usage
    root.swapTotalGb = (swapTotal / 1048576).toFixed(1);
    if (swapTotal > 0) {
      const swapUsedKb = swapTotal - swapFree;
      root.swapGb = (swapUsedKb / 1048576).toFixed(1);
      root.swapPercent = Math.round((swapUsedKb / swapTotal) * 100);
    } else {
      root.swapGb = 0;
      root.swapPercent = 0;
    }
  }

  function pushDiskHistory() {
    let newHistories = {};
    for (let path in diskPercents) {
      // Pre-fill with zeros if this is a new path
      let h = diskHistories[path] ? diskHistories[path].slice() : new Array(diskHistoryLength).fill(0);
      h.push(diskPercents[path]);
      if (h.length > diskHistoryLength)
      h.shift();
      newHistories[path] = h;
    }
    diskHistories = newHistories;
  }

  function pushMemHistory() {
    let h = memHistory.slice();
    h.push(memPercent);
    if (h.length > memHistoryLength)
    h.shift();
    memHistory = h;
  }

  function calculateLineUsage(line) {
    const parts = line.trim().split(/\s+/);
    const stats = {
      "user": parseInt(parts[1]) || 0,
      "nice": parseInt(parts[2]) || 0,
      "system": parseInt(parts[3]) || 0,
      "idle": parseInt(parts[4]) || 0,
      "iowait": parseInt(parts[5]) || 0,
      "irq": parseInt(parts[6]) || 0,
      "softirq": parseInt(parts[7]) || 0,
      "steal": parseInt(parts[8]) || 0,
      "guest": parseInt(parts[9]) || 0,
      "guestNice": parseInt(parts[10]) || 0
    };
    return stats;
  }

  function computeUsage(prev, curr) {
    if (!prev || !curr)
    return -1;
    const currTotalIdle = curr.idle + curr.iowait;
    const currTotal = Object.values(curr).reduce((sum, val) => sum + val, 0);
    const prevTotalIdle = prev.idle + prev.iowait;
    const prevTotal = Object.values(prev).reduce((sum, val) => sum + val, 0);

    const diffTotal = currTotal - prevTotal;
    const diffIdle = currTotalIdle - prevTotalIdle;
    if (diffTotal > 0) {
      return ((diffTotal - diffIdle) / diffTotal) * 100;
    }
    return -1;
  }

  function calculateCpuUsage(text) {
    if (!text)
    return;
    const lines = text.split('\n');
    const cpuLine = lines[0];

    // First line is total CPU
    if (!cpuLine.startsWith('cpu '))
    return;

    const currCpuStats = calculateLineUsage(cpuLine);
    const usage = computeUsage(root.prevCpuStats, currCpuStats);

    if (usage >= 0) {
      root.cpuUsage = usage;
      root.pushCpuHistory();
    }
    root.prevCpuStats = currCpuStats;

    // Find the number of CPU cores
    let nbCores = 0;
    for (let i = 1; i < lines.length; i++) {
      if (!lines[i].startsWith('cpu'))
      break;
      nbCores++;
    }

    // Fallback if we did not find any cores
    if (nbCores === 0)
    return;

    // If we found more cores than before, we reset our stats
    if (root.coresUsage.length < nbCores)
    root.coresUsage = new Array(nbCores).fill(0);

    let coresStats = [];
    let newCoresUsage = root.coresUsage.slice();
    for (let i = 0; i < nbCores; i++) {
      const coreCpuLine = lines[i + 1];
      const currCoreStats = calculateLineUsage(coreCpuLine);
      const coreUsage = computeUsage(root.prevCpuCoresStats?.[i], currCoreStats);
      if (coreUsage >= 0) {
        newCoresUsage[i] = coreUsage;
      }
      coresStats.push(currCoreStats);
    }
    root.coresUsage = newCoresUsage;
    root.prevCpuCoresStats = coresStats;
  }

  function pushCpuHistory() {
    let h = cpuHistory.slice();
    h.push(cpuUsage);
    if (h.length > cpuHistoryLength)
    h.shift();
    cpuHistory = h;
  }
  FileView {
    id: cpuStatFile
    path: "/proc/stat"
    onLoaded: calculateCpuUsage(text())
  }
  FileView {
    id: memInfoFile
    path: "/proc/meminfo"
    onLoaded: parseMemoryInfo(text())
  }

  Process {
    id: dfShell
    command: ["sh"]
    stdinEnabled: true
    running: false

    onRunningChanged: {
      if (!running && root.shouldRun) {
        // Restart if it died unexpectedly while we still need it
        Logger.w("SystemStat", "Disk shell exited unexpectedly, restarting");
        Qt.callLater(() => {
            dfShell.running = true;
        });
      }
    }

    stdout: SplitParser {
      splitMarker: "@@DF_END@@"
      onRead: data => {
        const lines = data.trim().split('\n');
        const newPercents = {};
        const newAvailPercents = {};
        const newUsedGb = {};
        const newSizeGb = {};
        const newAvailableGb = {};
        const bytesPerGb = 1000 * 1000 * 1000;
        // Start from line 1 (skip header)
        for (var i = 1; i < lines.length; i++) {
          const parts = lines[i].trim().split(/\s+/);
          if (parts.length >= 5) {
            const target = parts[0];
            const percent = parseInt(parts[1].replace(/[^0-9]/g, '')) || 0;
            const usedBytes = parseFloat(parts[2]) || 0;
            const sizeBytes = parseFloat(parts[3]) || 0;
            const availBytes = parseFloat(parts[4]) || 0;
            const availPercent = sizeBytes > 0 ? (availBytes / sizeBytes) * 100 : 0;
            newPercents[target] = percent;
            newAvailPercents[target] = Math.round(availPercent);
            newUsedGb[target] = usedBytes / bytesPerGb;
            newSizeGb[target] = sizeBytes / bytesPerGb;
            newAvailableGb[target] = availBytes / bytesPerGb;
          }
        }
        root.diskPercents = newPercents;
        root.diskAvailPercents = newAvailPercents;
        root.diskUsedGb = newUsedGb;
        root.diskSizeGb = newSizeGb;
        root.diskAvailableGb = newAvailableGb;
        root.pushDiskHistory();
      }
    }
  }

  Timer {
    interval: 1000
    running: root.shouldRun
    repeat: true
    onTriggered: {
      cpuStatFile.reload()
      memInfoFile.reload()
    }
  }
  Timer {
    id: diskTimer
    interval: root.diskIntervalMs
    repeat: true
    running: root.shouldRun
    triggeredOnStart: true
    onTriggered: {
      if (dfShell.running) {
        dfShell.write("df --output=target,pcent,used,size,avail --block-size=1 -x efivarfs 2>/dev/null; echo '@@DF_END@@'\n");
      }
    }
  }

}
