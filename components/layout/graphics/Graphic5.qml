import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent

  // Main background shape
  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)
    startX: width * 0.07; startY: height * 0.02
    PathLine{x: width * 0.02 ;y: height * 0.07 }
    PathLine{x: width * 0.02 ;y: height * 0.92 }
    PathLine{x: width * 0.07 ;y: height * 0.98 }
    PathLine{x: width * 0.92 ;y: height * 0.98 }
    PathLine{x: width * 0.98 ;y: height * 0.92 }
    PathLine{x: width * 0.98 ;y: height * 0.07 }
    PathLine{x: width * 0.92 ;y: height * 0.02 }
    PathLine{x: width * 0.07 ;y: height * 0.02 }
  }

  // Glow effect layer
  Shape {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 25
      color: "#5b2adc"
    }

    // Border outline
    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "transparent"
      startX: width * 0.07; startY: height * 0.02
      PathLine{x: width * 0.02 ;y: height * 0.07 }
      PathLine{x: width * 0.02 ;y: height * 0.92 }
      PathLine{x: width * 0.07 ;y: height * 0.98 }
      PathLine{x: width * 0.92 ;y: height * 0.98 }
      PathLine{x: width * 0.98 ;y: height * 0.92 }
      PathLine{x: width * 0.98 ;y: height * 0.07 }
      PathLine{x: width * 0.92 ;y: height * 0.02 }
      PathLine{x: width * 0.07 ;y: height * 0.02 }
    }

    // Góc trên bên trái
    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.06; startY: height * 0.02
      PathLine{x: width * 0.02 ;y: height * 0.06 }
      PathLine{x: width * 0.02 ;y: height * 0.05 }
      PathLine{x: width * 0.05 ;y: height * 0.02 }
      PathLine{x: width * 0.06 ;y: height * 0.02 }
    }

    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.04; startY: height * 0.02
      PathLine{x: width * 0.02 ;y: height * 0.04 }
      PathLine{x: width * 0.02 ;y: height * 0.035 }
      PathLine{x: width * 0.035 ;y: height * 0.02 }
      PathLine{x: width * 0.04 ;y: height * 0.02 }
    }

    // Góc trên bên phải
    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.94; startY: height * 0.02
      PathLine{x: width * 0.98 ;y: height * 0.06 }
      PathLine{x: width * 0.98 ;y: height * 0.05 }
      PathLine{x: width * 0.95 ;y: height * 0.02 }
      PathLine{x: width * 0.94 ;y: height * 0.02 }
    }

    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.96; startY: height * 0.02
      PathLine{x: width * 0.98 ;y: height * 0.04 }
      PathLine{x: width * 0.98 ;y: height * 0.035 }
      PathLine{x: width * 0.965 ;y: height * 0.02 }
      PathLine{x: width * 0.96 ;y: height * 0.02 }
    }

    // Góc dưới bên trái
    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.06; startY: height * 0.98
      PathLine{x: width * 0.02 ;y: height * 0.94 }
      PathLine{x: width * 0.02 ;y: height * 0.95 }
      PathLine{x: width * 0.05 ;y: height * 0.98 }
      PathLine{x: width * 0.06 ;y: height * 0.98 }
    }

    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.04; startY: height * 0.98
      PathLine{x: width * 0.02 ;y: height * 0.96 }
      PathLine{x: width * 0.02 ;y: height * 0.965 }
      PathLine{x: width * 0.035 ;y: height * 0.98 }
      PathLine{x: width * 0.04 ;y: height * 0.98 }
    }

    // Góc dưới bên phải
    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.94; startY: height * 0.98
      PathLine{x: width * 0.98 ;y: height * 0.94 }
      PathLine{x: width * 0.98 ;y: height * 0.95 }
      PathLine{x: width * 0.95 ;y: height * 0.98 }
      PathLine{x: width * 0.94 ;y: height * 0.98 }
    }

    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: width * 0.96; startY: height * 0.98
      PathLine{x: width * 0.98 ;y: height * 0.96 }
      PathLine{x: width * 0.98 ;y: height * 0.965 }
      PathLine{x: width * 0.965 ;y: height * 0.98 }
      PathLine{x: width * 0.96 ;y: height * 0.98 }
    }
  }
}
