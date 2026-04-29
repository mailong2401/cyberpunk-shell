import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick.Effects

import qs.modules.bar
import qs.commons
import  qs.modules.widget

ShellRoot {
  id: root

  FontLoader {
    id: cyberFont
    source: "assets/fonts/GlitchGoblin.ttf"
  }

  property bool settingsLoaded: false
  Connections {
    target: Settings ? Settings : null
    function onSettingsLoaded() {
      root.settingsLoaded = true;
    }
  }
  Loader {
    active: root.settingsLoaded && Directories.ready
    sourceComponent: Item {
      Component.onCompleted: {
      }
      PanelLeft{}
      PanelRight{}
      Bar {}
    }
  }
}
