pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
  id: visibleService
  property bool dashboard: false
  property bool hasPanel: dashboard != null
  signal panelChanged(string panelName, bool visible)

}
