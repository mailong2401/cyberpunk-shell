import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent
  layer.enabled: true

  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)

    startX: 0; startY: 43

    PathLine { x: shape.width * 0.005; y: 43 }
    PathLine { x: shape.width * 0.02; y: 58 }
    PathLine { x: shape.width * 0.05; y: 58 }
    PathLine { x: shape.width * 0.07; y: 43 }

    PathLine { x: width * 0.2; y: 43 }
    PathLine { x: width * 0.22; y: 50 }
    PathLine { x: width * 0.8; y: 50 }
    PathLine { x: width * 0.82; y: 43 }

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

    ShapePath {
      strokeWidth: 2
      strokeColor: "#831C91"
      fillColor: "transparent"

      startX: 0; startY: 43

      PathLine { x: width * 0.005; y: 43 }
      PathLine { x: width * 0.02; y: 58 }
      PathLine { x: width * 0.05; y: 58 }
      PathLine { x: width * 0.07; y: 43 }

      PathLine { x: width * 0.2; y: 43 }
      PathLine { x: width * 0.22; y: 50 }
      PathLine { x: width * 0.8; y: 50 }
      PathLine { x: width * 0.82; y: 43 }

      PathLine { x: width * 0.9; y: 43 }

      PathLine { x: width * 0.93; y: 58 }
      PathLine { x: width * 0.96; y: 58 }
      PathLine { x: width * 0.99; y: 43 }
      PathLine { x: width; y: 43 }
    }
  }
}
