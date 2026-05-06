import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects
import qs.services

RowLayout {
  Layout.alignment: Qt.AlignVCenter
  Layout.bottomMargin: 10
  spacing: 20

  // System Stats Section
  readonly property var stats: [
  { label: "CPU", value: SystemStatService.cpuUsage.toFixed(1)},
  { label: "RAM", value: SystemStatService.memPercent},
  { label: "GPU", value: 0 },
  { label: "SSD", value: SystemStatService.diskPercents?.["/"]}
  ]

  // System Icons Section
  readonly property var icons: [
  { name: "wifi", label: "WiFi" },
  { name: "volume_up", label: "Volume" },
  { name: "brightness_7", label: "Brightness" },
  { name: "power_settings_new", label: "Power" }
  ]

  // Render stats
  Repeater {
    model: stats
    RowLayout {
      spacing: 8

      Text {
        layer.enabled: true
        layer.effect: Glow {
          radius: 10
          samples: 16
          color: "#831C91"
        }
        font.family: cyberFont.name
        text: modelData.label
        color: "white"
        font.pixelSize: 18
      }

      Text {
        text: modelData.value + "%"
        layer.enabled: true
        layer.effect: Glow {
          radius: 12
          samples: 25
          color: "#5b2adc"
        }
        color: "white"
        font.family: cyberFont.name
        font.pixelSize: 18
        font.bold: true
      }
    }
  }

  // Spacer
  Item { implicitWidth: 50 }

  // Render icons
  Repeater {
    model: icons
    Text {
      font.family: "Material Symbols Rounded"
      text: modelData.name
      font.pixelSize: 30
      layer.enabled: true
      layer.effect: Glow {
        radius: 12
        samples: 25
        color: "#5b2adc"
      }
      color: "white"

      MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: {
          console.log("Clicked:", modelData.label)
          // Handle icon clicks here
        }
      }
    }
  }
}
