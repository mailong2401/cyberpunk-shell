import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick.Effects

import qs.modules.bar
import qs.commons

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
            Bar {}
        }
    }
}
