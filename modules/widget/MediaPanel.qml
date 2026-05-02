pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects
import qs.services
import Quickshell.Services.Mpris
import  qs.components.layout.graphics

Rectangle {
  id: musicPanel

  color: "transparent"
  implicitHeight: 300
  implicitWidth: parent.width
  radius: 16

  Graphic3{}

  // Bind to active player
  readonly property var currentPlayer: Players.mprisPlayer
  function formatTime(seconds) {
    if (isNaN(seconds) || seconds < 0)
    return "00:00"

    var totalSeconds = Math.floor(seconds)
    var minutes = Math.floor(totalSeconds / 60)
    var secs = totalSeconds % 60

    function pad(n) {
      return n < 10 ? "0" + n : n
    }

    return pad(minutes) + ":" + pad(secs)
  }

  ColumnLayout {
    anchors.fill: parent
    anchors.leftMargin: 40
    anchors.bottomMargin: 50
    anchors.topMargin: 40
    anchors.rightMargin: 40
    spacing: 5

    // Header: MUSIC PLAYER title
    Text {
      text: "MUSIC PLAYER"
      color: "white"
      font {
        bold: true
        pixelSize: 18
        letterSpacing: 2
      }

      layer.enabled: true
      layer.effect: Glow {
        radius: 6
        samples: 12
        color: "#831C91"
        spread: 0.3
      }
    }

    // Main content area with album art and song info
    RowLayout {
      Layout.fillWidth: true
      Layout.preferredHeight: 140
      spacing: 20

      // Album art container
      Rectangle {
        id: albumArtContainer
        Layout.preferredWidth: 120
        Layout.preferredHeight: 120
        radius: 12
        color: "#1a1a1a"
        border.color: "#831C91"
        border.width: 1
        clip: true

        Image {
          id: albumImage
          anchors.fill: parent
          source: Players.getArtUrl(currentPlayer)
          fillMode: Image.PreserveAspectCrop
          visible: status === Image.Ready
          asynchronous: true
          smooth: true
          cache: false
        }

        // Placeholder when no album art
        Column {
          anchors.centerIn: parent
          spacing: 8
          visible: albumImage.status !== Image.Ready || !currentPlayer
          Text {
            text: "No Art"
            font.pixelSize: 12
            font.family: "ComicShannsMono Nerd Font"
            color: "#888"
            anchors.horizontalCenter: parent.horizontalCenter
          }
        }
      }

      // Song info
      ColumnLayout {
        Layout.fillWidth: true
        spacing: 8

        // Track title with marquee effect
        Rectangle {
          Layout.fillWidth: true
          Layout.preferredHeight: 30
          color: "transparent"
          clip: true

          Text {
            id: songText
            text: currentPlayer?.trackTitle ?? "Not Playing"
            layer.enabled: true
            layer.effect: Glow {
              radius: 12
              samples: 25
              color: "#5b2adc"
            }
            color: "white"
            font {
              family: "ComicShannsMono Nerd Font"
              pixelSize: 18
              bold: true
            }

            // Check if text needs to scroll
            property bool needsMarquee: width > parent.width

            // Set initial position
            x: 0

            // Marquee animation
            SequentialAnimation on x {
              id: marqueeAnimation
              running: songText.needsMarquee && musicPanel.visible
              loops: Animation.Infinite

              // Pause at start
              PauseAnimation {
                duration: 2000
              }

              // Scroll left
              NumberAnimation {
                to: -(songText.width - songText.parent.width)
                duration: Math.max(2000, (songText.width - songText.parent.width) * 30)
                easing.type: Easing.Linear
              }

              // Pause at end
              PauseAnimation {
                duration: 2000
              }

              // Scroll back
              NumberAnimation {
                to: 0
                duration: Math.max(2000, (songText.width - songText.parent.width) * 30)
                easing.type: Easing.Linear
              }
            }

            // Reset position when text changes
            onTextChanged: {
              x = 0;
              marqueeAnimation.restart();
            }
          }
        }

        // Artist name
        Text {
          text: currentPlayer?.trackArtist ?? "Unknown Artist"
          color: "#b0b0b0"
          font {
            pixelSize: 14
          }
          Layout.fillWidth: true
          elide: Text.ElideRight
        }

        // Album name (optional)
        Text {
          text: currentPlayer?.trackAlbum ?? ""
          color: "#808080"
          font {
            pixelSize: 12
          }
          Layout.fillWidth: true
          elide: Text.ElideRight
          visible: text !== ""
        }
      }
    }

    // Progress bar section
    ColumnLayout {
      Layout.fillWidth: true
      spacing: 6

      // Progress bar
      Rectangle {
        id: parent_progress_bar
        Layout.fillWidth: true
        Layout.preferredHeight: 4
        radius: 2
        color: "#2a2a2a"

        Rectangle {
          id: progress_bar
          width: parent.width * getProgress()
          height: parent.height
          radius: 2
          color: "white"

          // Glow effect on progress bar
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }
      }

      // Time labels
      RowLayout {
        Layout.fillWidth: true
        spacing: 0

        Text {
          id: timeText
          text: musicPanel.formatTime(currentPlayer?.position)
          color: "#a0a0a0"
          font {
            pixelSize: 11
            family: "monospace"
          }
          Layout.alignment: Qt.AlignLeft
        }

        Item {
          Layout.fillWidth: true
        }

        Text {
          text: musicPanel.formatTime(currentPlayer.length)
          color: "#a0a0a0"
          font {
            pixelSize: 11
            family: "monospace"
          }
          Layout.alignment: Qt.AlignRight
        }
      }
    }

    // Control buttons
    RowLayout {
      Layout.fillWidth: true
      Layout.topMargin: 4
      spacing: 20
      Layout.alignment: Qt.AlignHCenter

      // Previous button
      Text {
        font.family: "Material Symbols Rounded"
        text: "skip_previous"
        layer.enabled: true
        layer.effect: Glow {
          radius: 12
          samples: 25
          color: "#5b2adc"
        }
        font {
          bold: true
          pixelSize: 32
        }
        color: "white"
      }

      // Play/Pause button
      Text {
        font.family: "Material Symbols Rounded"
        text: "play_arrow"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#5b2adc"
        }
        font {
          bold: true
          pixelSize: 32
        }
        color: "white"
      }

      // Next button
      Text {
        font.family: "Material Symbols Rounded"
        layer.enabled: true
        layer.effect: Glow {
          radius: 8
          samples: 16
          color: "#5b2adc"
        }
        text: "skip_next"
        font {
          bold: true
          pixelSize: 32
        }
        color: "white"
      }
    }

    Item {
      Layout.fillHeight: true
    }
  }

  // Helper functions
  function getProgress() {
    if (!currentPlayer)
    return 0

    var pos = currentPlayer.position ?? 0
    var len = currentPlayer.length ?? 0

    if (len <= 0 || pos < 0)
    return 0

    var progress = pos / len

    return Math.max(0, Math.min(1, progress))
  }
  Timer {
    interval: 1000   // 1 giây
    running: true
    repeat: true
    onTriggered: {
      timeText.text = musicPanel.formatTime(currentPlayer?.position)
      progress_bar.width = parent_progress_bar.width * getProgress()
    }
  }

}
