import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

RowLayout {
  Layout.alignment: Qt.AlignCenter

  Text {

    layer.enabled: true
    layer.effect: Glow {
      radius: 3
      samples: 16
      color: "#ff00ff"
    }
    font.family: "Material Symbols Rounded"
    text: "home"
    font.pixelSize: 32
    color: "#ff00ff"
  }
}
