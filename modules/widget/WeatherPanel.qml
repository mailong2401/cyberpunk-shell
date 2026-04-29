import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

Rectangle {
  color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
  implicitHeight: 300
  implicitWidth: parent.width
  radius: 16

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 30
    spacing: 8

    // Phần trên: Icon + Nhiệt độ + Mô tả + Địa điểm
    RowLayout {
      Layout.alignment: Qt.AlignHCenter
      Text {
        font.family: "Material Symbols Rounded"
        text: "weather_hail"
        font.pixelSize: 80
        color: "#ffffff"
        layer.enabled: true
        layer.effect: Glow {
          radius: 12
          samples: 25
          color: "#5b2adc"
        }
      }

      ColumnLayout {
        spacing: 4

        Text {
          id: tempText
          text: "24°C"
          color: "#ffffff"
          font.pixelSize: 40
          font.bold: true
          font.family: "monospace"
          Layout.alignment: Qt.AlignVCenter

          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }

          Rectangle {
            anchors.fill: parent
            color: "transparent"
            opacity: 0.5

            SequentialAnimation on opacity {
              loops: Animation.Infinite
              NumberAnimation { from: 0.2; to: 0.8; duration: 1000; easing.type: Easing.InOutQuad }
              NumberAnimation { from: 0.8; to: 0.2; duration: 1000; easing.type: Easing.InOutQuad }
            }
          }

          SequentialAnimation on color {
            loops: Animation.Infinite
            ColorAnimation { from: "#ffffff"; to: "#e0d0ff"; duration: 800 }
            ColorAnimation { from: "#e0d0ff"; to: "#ffffff"; duration: 800 }
          }
        }

        Text {
          text: "Light Rain"
          color: "white"
          font {
            pixelSize: 16
          }
        }

        Text {
          text: "Tokyo, Japan"
          color: "white"
          font {
            pixelSize: 12
          }
        }
      }
    }

    RowLayout {
      Layout.fillWidth: true

      // Saturday
      ColumnLayout {
        Text {
          text: "SAT"
          color: "#aaaaaa"
          font.pixelSize: 12
          Layout.alignment: Qt.AlignHCenter
        }
        Text {
          font.family: "Material Symbols Rounded"
          text: "weather_hail"
          font.pixelSize: 40
          color: "#ffffff"
          Layout.alignment: Qt.AlignHCenter
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }
        RowLayout {
          Layout.alignment: Qt.AlignHCenter
          Text {
            text: "25°"
            color: "white"
            font.pixelSize: 14
          }
          Text {
            text: "/"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
          Text {
            text: "18°"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
        }
      }

      Item { Layout.fillWidth: true }
      // Sunday
      ColumnLayout {
        Text {
          text: "SUN"
          color: "#aaaaaa"
          font.pixelSize: 12
          Layout.alignment: Qt.AlignHCenter
        }
        Text {
          font.family: "Material Symbols Rounded"
          text: "weather_hail"
          font.pixelSize: 40
          color: "#ffffff"
          Layout.alignment: Qt.AlignHCenter
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }
        RowLayout {
          Layout.alignment: Qt.AlignHCenter
          Text {
            text: "27°"
            color: "white"
            font.pixelSize: 14
          }
          Text {
            text: "/"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
          Text {
            text: "19°"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
        }
      }

      Item { Layout.fillWidth: true }
      // Monday
      ColumnLayout {
        Text {
          text: "MON"
          color: "#aaaaaa"
          font.pixelSize: 12
          Layout.alignment: Qt.AlignHCenter
        }
        Text {
          font.family: "Material Symbols Rounded"
          text: "weather_hail"
          font.pixelSize: 40
          color: "#ffffff"
          Layout.alignment: Qt.AlignHCenter
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }
        RowLayout {
          Layout.alignment: Qt.AlignHCenter
          Text {
            text: "28°"
            color: "white"
            font.pixelSize: 14
          }
          Text {
            text: "/"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
          Text {
            text: "20°"
            color: "#aaaaaa"
            font.pixelSize: 14
          }
        }
      }

      // Tuesday
    }
  }
}
