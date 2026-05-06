import QtQuick
import QtQuick.Layouts
import Quickshell
import  Quickshell.Io
import Qt5Compat.GraphicalEffects
import qs.components.layout.graphics
import qs.components
import qs.commons

Rectangle {
  color: Qt.rgba(0.04, 0.04, 0.04, 0.8)
  implicitHeight: 300
  implicitWidth: parent.width
  radius: 16

  Graphic2{}

  readonly property var menuItems: [
  { icon: "desktop_windows", label: "My PC" },
  { icon: "description", label: "Documents" },
  { icon: "download", label: "Downloads" },
  { icon: "image", label: "Pictures" },
  { icon: "music_note", label: "Music" },
  { icon: "videocam", label: "Videos" },
  { icon: "settings", label: "Settings" },
  { icon: "delete", label: "Trash" }
  ]

  Process {
    id: openProc
  }

  function openPath(label) {
    let home = Directories.home
    let path = ""

    switch (label) {
      case "My PC":
      path = home + "/"
      break
      case "Documents":
      path = home + "/Documents"
      break
      case "Downloads":
      path =home + "/Downloads"
      break
      case "Pictures":
      path = home + "/Pictures"
      break
      case "Music":
      path = home + "/Music"
      break
      case "Videos":
      path = home + "/Videos"
      break
      case "Trash":
      path = "trash:///"
      break
      case "Settings":
      return
    }

    openProc.command = ["sh", "-c", "nautilus '" + path + "' &"]
    openProc.running = true
  }

  RowLayout {
    anchors.fill: parent
    anchors.leftMargin: 0
    anchors.topMargin: 30
    anchors.rightMargin: 30
    anchors.bottomMargin: 30
    spacing: 30

    // Left sidebar with rotated text
    RowLayout {
      spacing: 0

      Item {
        implicitWidth: 20
        Layout.fillHeight: true
        Text {
          text: "NEON CYBERPUNK"
          color: "#831C91"
          rotation: 270
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 45
          font { family: cyberFont.name; pixelSize: 12 }
        }
      }

      Item {
        implicitWidth: 15
        Layout.fillHeight: true
        clip: true
        Text {
          text: "FILE SYSTEM"
          color: "#831C91"
          rotation: 270
          anchors.horizontalCenter: parent.horizontalCenter
          anchors.bottom: parent.bottom
          anchors.bottomMargin: 20
          font { family: cyberFont.name; pixelSize: 8 }
        }
      }
    }

    // Main menu items
    ColumnLayout {
      spacing: 3

      Repeater {
        model: menuItems

        Rectangle {
          id: itemRoot
          radius: 8
          color: hovered ? Qt.rgba(0.2, 0, 0.3, 0.4) : "transparent"

          property bool hovered: false

          Layout.fillWidth: true
          implicitHeight: 30

          RowLayout {
            anchors.fill: parent
            anchors.leftMargin: 10
            spacing: 20

            GlowIcon {
              id: iconItem
              text: modelData.icon
              font.pixelSize: hovered ? 24 : 20

              Behavior on font.pixelSize {
                NumberAnimation { duration: 150 }
              }
            }

            GlowText {
              id: labelItem
              text: modelData.label
              color: hovered ? "#ff66ff" : "white"
              font.pixelSize: hovered ? 20 : 18

              Behavior on color {
                ColorAnimation { duration: 150 }
              }

              Behavior on font.pixelSize {
                NumberAnimation { duration: 150 }
              }
            }
          }

          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onEntered: itemRoot.hovered = true
            onExited: itemRoot.hovered = false

            onClicked: {
              openPath(modelData.label)
            }
          }

          Behavior on color {
            ColorAnimation { duration: 150 }
          }
        }
      }
    }
  }
}
