import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Item {
  Layout.fillHeight: true
  Layout.preferredWidth: textTitle.implicitWidth
  Shape {
    id: shapeText
    anchors.fill: parent

    ShapePath {
      strokeWidth: 2
      strokeColor: "#ff00ff"
      fillColor: "transparent"
      joinStyle: ShapePath.MiterJoin

      startX: 0
      startY: 10

      // ===== line ngang tới hết chữ =====
      PathLine { x: textTitle.x + textTitle.width; y: 10 }

      // ===== chéo xuống =====
      PathLine { x: textTitle.x + textTitle.width + 15; y: 25 }

      // ===== kéo ngang tiếp =====
      PathLine { x: shapeText.width + 50; y: 25 }
    }
  }
  Text {
    id: textTitle
    text: "CYBERPUNK 2077"
    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
      leftMargin: 10
    }

    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#ff00ff"
    }
    font.family: cyberFont.name
    font.pixelSize: 24
    color: "#ff00ff"

    // Gradient animation qua màu sắc
    SequentialAnimation on color {
      loops: Animation.Infinite

      ColorAnimation { to: "#ffffff"; duration: 200 }
      ColorAnimation { to: "#f2eaff"; duration: 200 }
      ColorAnimation { to: "#e6d9ff"; duration: 200 }
      ColorAnimation { to: "#ffffff"; duration: 200 }
    }
    SequentialAnimation on opacity {
      loops: Animation.Infinite
      NumberAnimation { to: 0.7; duration: 800; easing.type: Easing.InOutQuad }
      NumberAnimation { to: 1.0; duration: 800; easing.type: Easing.InOutQuad }
    }
  }
}
