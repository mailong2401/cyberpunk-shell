import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects

Rectangle {
  color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
  implicitHeight: 250
  implicitWidth: parent.width
  radius: 16

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 30
    spacing: 8

    // Greeting
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 8
        samples: 16
        color: "#831C91"
      }
      Layout.alignment: Qt.AlignLeft
      text: "Good evening, Samurai."
      color: "white"
      font.pixelSize: 20
      font.bold: true
    }

    // Japanese Quote
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 5
        samples: 16
        color: "#831C91"
      }
      Layout.alignment: Qt.AlignLeft
      text: "未来は今日始まる。"
      color: "#e0e0f0"
      font.pixelSize: 16
      font.italic: true
    }

    // English Translation
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 3
        samples: 16
        color: "#831C91"
      }
      Layout.alignment: Qt.AlignLeft
      text: "The future begins today."
      color: "white"
      font.pixelSize: 16
    }

    // Spacer
    Item {
      Layout.fillHeight: true
    }

    // Bottom Row: Time, Temperature, Date
    ColumnLayout {
      Layout.alignment: Qt.AlignBottom
      Layout.fillWidth: true

      RowLayout{
        Text {
          text: "20:47"
          color: "white"
          layer.enabled: true
          layer.effect: Glow {
            radius: 8
            samples: 16
            color: "#5b2adc"
          }
          font.pixelSize: 40
        }

        // Temperature
        Text {
          text: "36°"
          color: "white"
          layer.enabled: true
          layer.effect: Glow {
            radius: 8
            samples: 16
            color: "#5b2adc"
          }
          font.pixelSize: 32
        }

      }

      // Date
      ColumnLayout {
        spacing: 2
        Text {
          text: "24 May, 2024"
          layer.enabled: true
          layer.effect: Glow {
            radius: 8
            samples: 16
            color: "#5b2adc"
          }
          color: "white"
          font.pixelSize: 16
        }
        Text {
          text: "Friday"
          layer.enabled: true
          layer.effect: Glow {
            radius: 8
            samples: 16
            color: "#5b2adc"
          }
          color: "white"
          font.pixelSize: 14
        }
      }
    }
  }
}
