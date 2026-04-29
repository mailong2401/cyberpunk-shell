import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects

PanelWindow {
  implicitWidth: 300
  implicitHeight: Screen.height
  WlrLayershell.exclusiveZone: 0   // không chiếm không gian ứng dụng
  color: "transparent"
  WlrLayershell.layer: WlrLayer.Bottom
  anchors {
    left: true
    bottom: true
    top: true
  }
  ColumnLayout{
    anchors.fill: parent
    anchors.margins: 16
    TimePanel{}
    ShortcutPanel{}
  }
}
