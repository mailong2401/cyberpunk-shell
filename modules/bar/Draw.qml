import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent

  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)

    startX: 0; startY: 43

    PathLine { x: shape.width * 0.005; y: 43 }
    PathLine { x: shape.width * 0.02; y: 58 }
    PathLine { x: shape.width * 0.05; y: 58 }
    PathLine { x: shape.width * 0.07; y: 43 }

    PathLine { x: shape.width * 0.9; y: 43 }

    PathLine { x: shape.width * 0.93; y: 58 }
    PathLine { x: shape.width * 0.96; y: 58 }
    PathLine { x: shape.width * 0.99; y: 43 }
    PathLine { x: shape.width; y: 43 }

    // đóng phía trên
    PathLine { x: shape.width; y: 0 }
    PathLine { x: 0; y: 0 }
    PathLine { x: 0; y: 43 }
  }

  // ===== CHỈ VẼ ĐƯỜNG DƯỚI =====
  Shape {
    anchors.fill: parent
    layer.enabled: true

    layer.effect: Glow {
      radius: 8
      samples: 16
      color: "#ff00ff"
    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "#ff00ff"
      fillColor: "transparent"

      startX: 0; startY: 43

      PathLine { x: width * 0.005; y: 43 }
      PathLine { x: width * 0.02; y: 58 }
      PathLine { x: width * 0.05; y: 58 }
      PathLine { x: width * 0.07; y: 43 }

      PathLine { x: width * 0.9; y: 43 }

      PathLine { x: width * 0.93; y: 58 }
      PathLine { x: width * 0.96; y: 58 }
      PathLine { x: width * 0.99; y: 43 }
      PathLine { x: width; y: 43 }
    }
  }
}
