pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
  id: visibleService

  property bool dashboard: false
  property bool hasPanel: dashboard

  signal panelChanged(string panelName, bool visible)

  function togglePanel(panelName) {
    switch (panelName) {
      case "dashboard":
      dashboard = !dashboard
      panelChanged(panelName, dashboard)
      break;
    }
  }
}
