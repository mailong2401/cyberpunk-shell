import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import qs.components.layout.graphics
import qs.components
import qs.services

PanelWindow {
  id: root
  implicitWidth: 700
  implicitHeight: 500
  focusable: true
  color: "transparent"

  anchors {
    top: true
    right: true
  }
  margins {
    top: 10
    right: 600
  }

  // Quick actions data
  readonly property var quickActions: [
  { name: "Settings", command: "gnome-control-center", icon: "settings" },
  { name: "Logout", command: "logout", icon: "logout" },
  { name: "Shutdown", command: "shutdown", icon: "power_settings_new" },
  { name: "Restart", command: "reboot", icon: "restart_alt" },
  { name: "Reset", command: "reset", icon: "refresh" }
  ]

  // App data from DesktopEntries
  property var apps: []
  property var allApps: []
  property string lastQuery: ""
  property int currentIndex: 0
  property string searchText: ""

  signal appLaunched

  // Load applications from DesktopEntries
  Repeater {
    id: appRepeater
    model: DesktopEntries.applications

    Item {
      Component.onCompleted: {
        allApps.push({
            name: modelData.name || "",
            comment: modelData.comment || "",
            icon: modelData.icon || "",
            exec: modelData.execString || "",
            entry: modelData
        });
      }
    }
  }

  Component.onCompleted: {
    Qt.callLater(function() {
        allApps.sort(function(a, b) {
            return a.name.toLowerCase().localeCompare(b.name.toLowerCase());
        });
        apps = allApps;
    });
    searchInput.forceActiveFocus()
  }

  // Filter apps based on search
  function runSearch(query) {
    if (query === undefined || query === null) query = "";
    lastQuery = query;
    searchText = query

    if (query.length === 0) {
      apps = allApps;
      currentIndex = 0;
      return;
    }

    var q = query.toLowerCase();
    var filtered = [];

    for (var i = 0; i < allApps.length; i++) {
      var app = allApps[i];
      var name = (app.name || "").toLowerCase();
      var comment = (app.comment || "").toLowerCase();
      var exec = (app.exec || "").toLowerCase();

      var match = name.indexOf(q) >= 0 || comment.indexOf(q) >= 0 || exec.indexOf(q) >= 0;

      if (!match && exec) {
        var execParts = exec.split(' ');
        if (execParts.length > 0) {
          var executableName = execParts[0];
          var lastSlash = executableName.lastIndexOf('/');
          if (lastSlash >= 0) {
            executableName = executableName.substring(lastSlash + 1);
          }
          match = executableName.toLowerCase().indexOf(q) >= 0;
        }
      }

      if (match) {
        filtered.push(app);
      }
    }

    apps = filtered;
    currentIndex = 0;
    appList.currentIndex = 0;
  }

  // Execute quick action
  function executeAction(action) {
    console.log("Action:", action.name)
    switch(action.command) {
      case "logout":
      // Handle logout
      break
      case "shutdown":
      // Handle shutdown
      break
      case "reboot":
      // Handle reboot
      break
      default:
      if(action.command.startsWith("gnome-control-center")) {
        // Open settings
      }
    }
    VisibleService.closeAllPanels()
  }

  Graphic5{}
  GraphicHeaderLauncher{}

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 50
    spacing: 15

    // Header
    Item {
      Layout.fillWidth: true
      implicitHeight: 80

      Text {
        text: "APPLICATIONS"
        anchors.centerIn: parent
        color: "white"
        font {
          bold: true
          pixelSize: 32
          letterSpacing: 4
          family: cyberFont.name
        }
        layer.enabled: true
        layer.effect: Glow {
          radius: 10
          samples: 20
          color: "#831C91"
        }
      }
    }

    // Main content
    RowLayout {
      id: layoutContent
      Layout.fillWidth: true
      Layout.fillHeight: true
      spacing: 20

      // Quick Actions Panel (Left)
      Item {
        implicitWidth: root.width * 0.3
        Layout.fillHeight: true

        ColumnLayout {
          anchors.fill: parent
          anchors.margins: 15
          spacing: 12

          ListView {
            id: actionList
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: 10
            model: quickActions
            currentIndex: -1
            focus: true
            keyNavigationWraps: true

            delegate: Rectangle {
              Graphic3{}
              width: actionList.width
              implicitHeight: 45
              radius: 8
              property bool hovered: false
              color: actionList.currentIndex === index ? Qt.rgba(0.51, 0.11, 0.57, 0.5) :
              (actionMouse.containsMouse ? Qt.rgba(0.51, 0.11, 0.57, 0.3) : "transparent")

              RowLayout {
                anchors.fill: parent
                anchors.leftMargin: 10
                spacing: 10

                GlowIcon {
                  text: modelData.icon
                  glowColor : "#831C91"

                  font.pixelSize: actionMouse.containsMouse ? 34 : 32
                  Behavior on font.pixelSize {
                    NumberAnimation { duration: 150 }
                  }

                }

                GlowText {
                  text: modelData.name
                  Layout.fillWidth: true
                  glowColor : "#831C91"
                  color: actionList.currentIndex === index ? "#ff66ff" :
                  (actionMouse.containsMouse ? "#ff66ff" : "#cccccc")
                  font {
                    pixelSize: actionMouse.containsMouse ? 18 : 16
                    family: cyberFont.name
                  }
                  Behavior on font.pixelSize {
                    NumberAnimation { duration: 150 }
                  }
                  Behavior on color {
                    ColorAnimation { duration: 150 }
                  }
                }
              }

              MouseArea {
                id: actionMouse
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                  actionList.currentIndex = index
                  executeAction(modelData)
                }
              }
            }
          }
        }
      }

      // Applications Panel (Right)
      ColumnLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 15

        // Search bar
        Item {
          implicitHeight: 45
          Layout.fillWidth: true
          Graphic5{}

          RowLayout {
            anchors.fill: parent
            anchors{
              leftMargin: 20
            }
            spacing: 8

            GlowIcon{
              text: "search"
              font.pixelSize: 20

            }

            TextInput {
              id: searchInput
              Layout.fillWidth: true
              color: "white"
              font.pixelSize: 14
              font.family: cyberFont.name
              selectByMouse: true
              focus: true

              onTextChanged: {
                runSearch(text)
              }

              Keys.onPressed: {
                if (event.key === Qt.Key_Down) {
                  event.accepted = true
                  appList.forceActiveFocus()
                  if (appList.count > 0) appList.currentIndex = 0
                } else if (event.key === Qt.Key_Escape) {
                  root.close()
                }
              }
            }
          }
        }

        // Applications ListView
        ListView {
          id: appList
          Layout.fillWidth: true
          Layout.fillHeight: true
          clip: true
          spacing: 4
          model: apps
          currentIndex: currentIndex
          focus: true
          keyNavigationWraps: true

          delegate: Item {
            width: appList.width
            implicitHeight: 56
            Graphic2_1{}

            RowLayout {
              anchors.fill: parent
              clip: true
              anchors{
                leftMargin: parent.width * 0.12
                rightMargin: parent.width * 0.12
              }
              spacing: 10

              // App icon
              Item {
                Layout.preferredWidth: 36
                Layout.preferredHeight: 36

                Image {
                  width: 32
                  height: 32
                  anchors.centerIn: parent
                  fillMode: Image.PreserveAspectFit
                  source: modelData.icon ? "image://icon/" + modelData.icon : ""
                  asynchronous: true
                  visible: status === Image.Ready
                }
              }

              ColumnLayout {
                Layout.fillWidth: true
                spacing: 2

                Text {
                  text: modelData.name || "Unknown"
                  color: (ListView.isCurrentItem || appMouse.containsMouse) ? "#ff66ff" : "white"
                  font.family: cyberFont.name
                  font.pixelSize: 16
                  font.bold: true
                  elide: Text.ElideRight
                }

                Text {
                  text: modelData.comment || ""
                  color: (ListView.isCurrentItem || appMouse.containsMouse) ? "#cccccc" : "#888888"
                  font.family: cyberFont.name
                  font.pixelSize: 12
                  elide: Text.ElideRight
                  visible: text !== ""
                }
              }
            }

            MouseArea {
              id: appMouse
              anchors.fill: parent
              hoverEnabled: true
              cursorShape: Qt.PointingHandCursor
              onClicked: {
                if (modelData && modelData.entry) {
                  modelData.entry.execute()
                  VisibleService.closeAllPanels()
                }
              }
              onEntered: {
                if (ListView.view) {
                  ListView.view.currentIndex = index
                  currentIndex = index
                }
              }
            }
          }

          // Keyboard navigation handlers
          Keys.onDownPressed: {
            if (currentIndex < apps.length - 1) {
              currentIndex++
              positionViewAtIndex(currentIndex, ListView.Center)
            }
          }

          Keys.onUpPressed: {
            if (currentIndex > 0) {
              currentIndex--
              positionViewAtIndex(currentIndex, ListView.Center)
            }
          }

          Keys.onReturnPressed: {
            if (currentIndex >= 0 && currentIndex < apps.length) {
              var item = apps[currentIndex]
              if (item && item.entry) {
                item.entry.execute()
                VisibleService.closeAllPanels()
              }
            }
          }
        }

        // No results text
        Text {
          visible: apps.length === 0
          text: "🔍 No applications found"
          color: "#666666"
          font {
            pixelSize: 14
            family: cyberFont.name
          }
          horizontalAlignment: Text.AlignHCenter
          Layout.alignment: Qt.AlignHCenter
        }
      }
    }
  }

  // Global keyboard shortcuts
  Shortcut {
    sequence: "Tab"
    onActivated: {
      if (appList.visible && appList.count > 0) {
        currentIndex = (currentIndex + 1) % apps.length
        appList.currentIndex = currentIndex
      }
    }
  }

  Shortcut {
    sequence: "Escape"
    onActivated: {
      root.close()
    }
  }

  // Close on escape
  Keys.onEscapePressed: {
    root.close()
  }
}
