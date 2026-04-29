import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects

PanelWindow {
  implicitWidth: 400
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
    Rectangle {
      color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
      implicitHeight: 300
      implicitWidth: parent.width
      radius: 16
      border.color: "#ff00ff"
      border.width: 1

      ColumnLayout {
        anchors.fill: parent
        anchors.margins: 30
        spacing: 15

        // Greeting
        Text {
          layer.enabled: true
          layer.effect: Glow {
            radius: 8
            samples: 16
            color: "#ff00ff"
          }
          Layout.alignment: Qt.AlignLeft
          text: "Good evening, Samurai."
          color: "white"
          font.pixelSize: 28
          font.bold: true
        }

        // Japanese Quote
        Text {
          layer.enabled: true
          layer.effect: Glow {
            radius: 5
            samples: 16
            color: "#ff00ff"
          }
          Layout.alignment: Qt.AlignLeft
          text: "未来は今日始まる。"
          color: "#e0e0f0"
          font.pixelSize: 22
          font.italic: true
        }

        // English Translation
        Text {
          layer.enabled: true
          layer.effect: Glow {
            radius: 3
            samples: 16
            color: "#ff00ff"
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
              font.pixelSize: 48
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
  }
}
