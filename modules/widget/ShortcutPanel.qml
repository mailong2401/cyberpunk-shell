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
    anchors.margins: 25
    spacing: 3

    // My PC
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "desktop_windows"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "My PC"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Documents
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "description"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Documents"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Downloads
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "download"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Downloads"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Pictures
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "image"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Pictures"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Music
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "music_note"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Music"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Videos
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "videocam"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Videos"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Settings
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "settings"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Settings"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }

    // Trash
    RowLayout {
      spacing: 20
      Text {
        font.family: "Material Symbols Rounded"
        text: "delete"
        font.pixelSize: 20
        color: "#831C91"
      }
      Text {
        text: "Trash"
        color: "white"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#831C91"
        }
        font{
          pixelSize: 18
        }
      }
    }
  }
}
