import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects
import qs.components.layout.graphics
import qs.components
import qs.services

Rectangle {
  id: root
  color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
  implicitHeight: 200
  implicitWidth: parent.width
  radius: 16

  property color barBackground: Qt.rgba(0.15, 0.15, 0.15, 0.8)

  // Define stats list
  readonly property var stats: [
  {
    label: "CPU Usage",
    getValue: () => SystemStatService.cpuUsage?.toFixed(1) || 0,
    getPercent: () => SystemStatService.cpuUsage || 0
  },
  {
    label: "RAM Usage",
    getValue: () => SystemStatService.memPercent || 0,
    getPercent: () => SystemStatService.memPercent || 0
  },
  {
    label: "GPU Usage",
    getValue: () => SystemStatService.gpuUsage || 0,
    getPercent: () => SystemStatService.gpuUsage || 0
  },
  {
    label: "Disk",
    getValue: () => SystemStatService.diskPercents?.["/"] || 0,
    getPercent: () => SystemStatService.diskPercents?.["/"] || 0
  }
  ]

  Component.onCompleted: {
    SystemStatService.registerComponent("cpu-widget")
  }

  Component.onDestruction: {
    SystemStatService.unregisterComponent("cpu-widget")
  }

  Graphic1{}

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 25
    spacing: 10

    // Title
    Text {
      text: "SYSTEM"
      color: "white"
      font { bold: true; pixelSize: 20 }
      layer.enabled: true
      layer.effect: Glow {
        radius: 8
        samples: 16
        color: "#831C91"
      }
    }

    // Stats rows
    Repeater {
      model: stats

      RowLayout {
        Layout.fillWidth: true
        spacing: 10

        GlowText {
          text: modelData.label
          font.pixelSize: 16

        }

        Item { Layout.fillWidth: true }

        // Progress bar
        Rectangle {
          implicitWidth: 100
          implicitHeight: 8
          radius: 4
          color: root.barBackground

          Rectangle {
            height: parent.height
            width: parent.width * (modelData.getPercent() / 100)
            radius: 4
            color: "white"

            layer.enabled: true
            layer.effect: Glow {
              radius: 10
              samples: 20
              color: "#831C91"
            }

            Behavior on width {
              NumberAnimation {
                duration: 800
                easing.type: Easing.OutCubic
              }
            }
          }
        }

        Item {
          implicitWidth: 30
          Layout.fillHeight: true
          GlowText {
            text: modelData.getValue() + "%"
            font.pixelSize: 16
            horizontalAlignment: Text.AlignRight
          }

        }

      }
    }
  }
}
