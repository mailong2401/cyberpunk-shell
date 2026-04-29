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

  property color barBackground: Qt.rgba(0.15, 0.15, 0.15, 0.8)
  property color progressColor: "#831C91"
  property color textColor: "#c0c0d0"

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 25
    spacing: 8

    // Title
    Text {
      text: "NETWORK"
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

    Text {
      text: "127.0.0.1"
      color: textColor
      font.pixelSize: 16
    }

    // Upload section với canvas
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "Upload"
        color: textColor
        font.pixelSize: 16
        Layout.preferredWidth: 80
      }

      // Canvas vẽ sóng upload
      Canvas {
        id: uploadCanvas
        Layout.fillWidth: true
        Layout.preferredHeight: 30

        property var dataPoints: []
        property real time: 0
        property real amplitude: 0.3

        Timer {
          interval: 50
          running: true
          repeat: true
          onTriggered: {
            uploadCanvas.time += 0.1
            uploadCanvas.amplitude = 0.2 + Math.random() * 0.6
            uploadCanvas.requestPaint()
          }
        }

        onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)

          var centerY = height / 2

          // Vẽ đường grid mờ
          ctx.strokeStyle = Qt.rgba(0.3, 0.3, 0.3, 0.3)
          ctx.lineWidth = 0.5
          ctx.beginPath()
          ctx.moveTo(0, centerY)
          ctx.lineTo(width, centerY)
          ctx.stroke()

          // Vẽ sóng upload
          ctx.beginPath()
          ctx.strokeStyle = "#00ffff"
          ctx.lineWidth = 2
          ctx.shadowColor = "#00ffff"
          ctx.shadowBlur = 8

          for (var x = 0; x < width; x++) {
            var t = (x / width) * Math.PI * 4 + time
            var noise = Math.sin(t * 2.5) * amplitude * 0.5
            var wave = Math.sin(t) * amplitude * 0.4
            var y = centerY - (noise + wave) * (height / 2)

            if (x === 0) {
              ctx.moveTo(x, y)
            } else {
              ctx.lineTo(x, y)
            }
          }

          ctx.stroke()
          ctx.shadowBlur = 0

          // Vẽ fill dưới sóng
          ctx.lineTo(width, centerY)
          ctx.lineTo(0, centerY)
          ctx.closePath()

          var gradient = ctx.createLinearGradient(0, 0, 0, height)
          gradient.addColorStop(0, Qt.rgba(0, 1, 1, 0.3))
          gradient.addColorStop(1, Qt.rgba(0, 1, 1, 0.0))
          ctx.fillStyle = gradient
          ctx.fill()
        }
      }

      Text {
        text: "12.4 Mbps"
        color: "#00ffff"
        font.pixelSize: 16
        Layout.preferredWidth: 90
        horizontalAlignment: Text.AlignRight
      }
    }

    // Download section với canvas
    RowLayout {
      Layout.fillWidth: true
      spacing: 10

      Text {
        text: "Download"
        color: textColor
        font.pixelSize: 16
        Layout.preferredWidth: 80
      }

      // Canvas vẽ sóng download
      Canvas {
        id: downloadCanvas
        Layout.fillWidth: true
        Layout.preferredHeight: 30

        property real time: 0
        property real amplitude: 0.5

        Timer {
          interval: 50
          running: true
          repeat: true
          onTriggered: {
            downloadCanvas.time += 0.15
            downloadCanvas.amplitude = 0.3 + Math.random() * 0.7
            downloadCanvas.requestPaint()
          }
        }

        onPaint: {
          var ctx = getContext("2d")
          ctx.clearRect(0, 0, width, height)

          var centerY = height / 2

          // Grid line
          ctx.strokeStyle = Qt.rgba(0.3, 0.3, 0.3, 0.3)
          ctx.lineWidth = 0.5
          ctx.beginPath()
          ctx.moveTo(0, centerY)
          ctx.lineTo(width, centerY)
          ctx.stroke()

          // Vẽ sóng download
          ctx.beginPath()
          ctx.strokeStyle = "#ff00ff"
          ctx.lineWidth = 2
          ctx.shadowColor = "#ff00ff"
          ctx.shadowBlur = 8

          for (var x = 0; x < width; x++) {
            var t = (x / width) * Math.PI * 6 + time
            var wave1 = Math.sin(t * 1.8) * amplitude * 0.5
            var wave2 = Math.cos(t * 3.2) * amplitude * 0.3
            var y = centerY - (wave1 + wave2) * (height / 2)

            if (x === 0) {
              ctx.moveTo(x, y)
            } else {
              ctx.lineTo(x, y)
            }
          }

          ctx.stroke()
          ctx.shadowBlur = 0

          // Fill gradient
          ctx.lineTo(width, centerY)
          ctx.lineTo(0, centerY)
          ctx.closePath()

          var gradient = ctx.createLinearGradient(0, 0, 0, height)
          gradient.addColorStop(0, Qt.rgba(1, 0, 1, 0.3))
          gradient.addColorStop(1, Qt.rgba(1, 0, 1, 0.0))
          ctx.fillStyle = gradient
          ctx.fill()
        }
      }

      Text {
        text: "68.7 Mbps"
        color: "#ff00ff"
        font.pixelSize: 16
        Layout.preferredWidth: 90
        horizontalAlignment: Text.AlignRight
      }
    }
  }
}
