import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Item {
  Layout.fillHeight: true
  Layout.preferredWidth: textTitle.implicitWidth + 40
  Shape {
    id: shapeText
    anchors.fill: parent
    layer.enabled: true

    layer.effect: Glow {
      radius: 12
      samples: 25
      color: "#5b2adc"
    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "transparent"
      joinStyle: ShapePath.MiterJoin

      startX: 0
      startY: 10

      PathLine { x: textTitle.x + textTitle.width; y: 10 }
      PathLine { x: textTitle.x + textTitle.width + 15; y: 25 }
      PathLine { x: shapeText.width + 50; y: 25 }
    }
  }
  Text {
    id: textTitle
    text: "NEON CYBERPUNK"
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: 10
    }

    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    font.family: cyberFont.name
    font.pixelSize: 24
    color: "white"
  }
}
