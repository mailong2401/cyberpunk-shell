import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Qt5Compat.GraphicalEffects
import QtQuick.Shapes
import  qs.components.layout.graphics
import  qs.services

Item {
  implicitHeight: 270
  implicitWidth: parent.width

  Graphic1{}

  ColumnLayout {
    anchors.fill: parent
    anchors.leftMargin: 30
    anchors.bottomMargin: 40
    anchors.topMargin: 30
    anchors.rightMargin: 30
    spacing: 8

    Text {
      id: greetingText
      text: "Good evening, Samurai."
      color: "white"
      font.pixelSize: 20
      font.bold: true
      Layout.alignment: Qt.AlignLeft

      // Glow layer
      layer.enabled: true
      layer.effect: Glow {
        radius: 10
        samples: 20
        color: "#831C91"
      }

    }

    Text {
      id: japaneseText
      text: "未来は今日始まる。"
      color: "#e0e0f0"
      font.pixelSize: 16
      font.italic: true
      Layout.alignment: Qt.AlignLeft

      layer.enabled: true
      layer.effect: Glow {
        radius: 6
        samples: 17
        color: "#831C91"
      }
    }

    Text {
      id: englishText
      text: "The future begins today."
      color: "white"
      font.pixelSize: 16
      Layout.alignment: Qt.AlignLeft

      layer.enabled: true
      layer.effect: Glow {
        radius: 4
        samples: 17
        color: "#831C91"
      }
    }

    Item {
      Layout.fillHeight: true
    }

    ColumnLayout {
      Layout.alignment: Qt.AlignBottom
      Layout.fillWidth: true

      RowLayout {
        spacing: 15

        Text {
          id: timeText
          text: TimeService.getTimeString()
          color: "#ffffff"
          font.pixelSize: 40
          font.bold: true
          font.family: "monospace"
          Layout.alignment: Qt.AlignVCenter

          // Double glow cho time
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }

        Text {
          id: tempText
          text: "36°"
          color: "#ffffff"
          font.pixelSize: 32
          font.bold: true
          Layout.alignment: Qt.AlignVCenter
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }

        }
      }

      // Date với hiệu ứng scanline
      ColumnLayout {
        spacing: 2

        Text {
          id: dateText
          text: TimeService.getDateString()
          color: "white"
          font.pixelSize: 16

          layer.enabled: true
          layer.effect: Glow {
            radius: 6
            samples: 17
            color: "#5b2adc"
          }
        }

        Text {
          id: dayText
          text: TimeService.getWeekday()
          color: "white"
          font.pixelSize: 14

          layer.enabled: true
          layer.effect: Glow {
            radius: 4
            samples: 17
            color: "#5b2adc"
          }
        }
      }
    }
  }

}
