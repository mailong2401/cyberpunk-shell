import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

Rectangle {
  color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
  implicitHeight: 200
  implicitWidth: parent.width
  radius: 16
  border.color: "#831C91"
  border.width: 2

  property color barBackground: Qt.rgba(0.15, 0.15, 0.15, 0.8)
  property color progressColor: "#831C91"
  property color textColor: "#c0c0d0"

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 25
    spacing: 3

    // Title
    Text {
      text: "NETWORK"
      color: "white"
      layer.enabled: true
      layer.effect: Glow {
        radius: 8
        samples: 16
        color: "#831C91"
      }
      font {
        bold: true
        pixelSize: 20
      }
    }

    Text {
      text: "127.0.0.1"
      color: textColor
      font.pixelSize: 16
    }

    // Upload section với ShaderEffect
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "Upload"
        color: textColor
        font.pixelSize: 16
        Layout.preferredWidth: 80
      }

      Text {
        text: "12.4 Mbps"
        color: "#00ffff"
        font.pixelSize: 16
        Layout.preferredWidth: 90
        horizontalAlignment: Text.AlignRight
      }
    }

    // Download section với ShaderEffect
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "Download"
        color: textColor
        font.pixelSize: 16
        Layout.preferredWidth: 80
      }

      Text {
        text: "68.7 Mbps"
        color: "#ff00ff"
        font.pixelSize: 16
        Layout.preferredWidth: 90
        horizontalAlignment: Text.AlignRight
      }
    }
  }
}
