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
  border.width: 1

  // Color properties
  property color barBackground: Qt.rgba(0.15, 0.15, 0.15, 0.8)
  property color progressColor: "#831C91"
  property color textColor: "#c0c0d0"

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 25
    spacing: 3

    // Title
    Text {
      text: "SYSTEM"
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

    // CPU Usage
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "CPU Usage"
        color: textColor
        font.pixelSize: 16
      }

      Item {
        Layout.fillWidth: true
      }

      Rectangle {
        implicitWidth: 100
        implicitHeight: 8
        radius: 4
        color: barBackground

        Rectangle {
          height: parent.height
          width: parent.width * 0.23
          radius: 4
          color: progressColor
          Behavior on width {
            NumberAnimation {
              duration: 800
              easing.type: Easing.OutCubic
            }
          }
        }
      }

      Text {
        text: "23%"
        color: textColor
        font.pixelSize: 16
      }
    }

    // RAM Usage
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "RAM Usage"
        color: textColor
        font.pixelSize: 16
      }

      Item {
        Layout.fillWidth: true
      }

      Rectangle {
        implicitWidth: 100
        implicitHeight: 8
        radius: 4
        color: barBackground

        Rectangle {
          height: parent.height
          width: parent.width * 0.48
          radius: 4
          color: progressColor
          Behavior on width {
            NumberAnimation {
              duration: 800
              easing.type: Easing.OutCubic
            }
          }
        }
      }

      Text {
        text: "48%"
        color: textColor
        font.pixelSize: 16
      }
    }

    // GPU Usage
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "GPU Usage"
        color: textColor
        font.pixelSize: 16
      }

      Item {
        Layout.fillWidth: true
      }

      Rectangle {
        implicitWidth: 100
        implicitHeight: 8
        radius: 4
        color: barBackground

        Rectangle {
          height: parent.height
          width: parent.width * 0.67
          radius: 4
          color: progressColor
          Behavior on width {
            NumberAnimation {
              duration: 800
              easing.type: Easing.OutCubic
            }
          }
        }
      }

      Text {
        text: "67%"
        color: textColor
        font.pixelSize: 16
      }
    }

    // Disk C:
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "Disk C:"
        color: textColor
        font.pixelSize: 16
      }

      Item {
        Layout.fillWidth: true
      }

      Rectangle {
        implicitWidth: 100
        implicitHeight: 8
        radius: 4
        color: barBackground

        Rectangle {
          height: parent.height
          width: parent.width * 0.72
          radius: 4
          color: progressColor
          Behavior on width {
            NumberAnimation {
              duration: 800
              easing.type: Easing.OutCubic
            }
          }
        }
      }

      Text {
        text: "72%"
        color: textColor
        font.pixelSize: 16
      }
    }
  }
}
