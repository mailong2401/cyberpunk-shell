import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent

  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)
    startX: width * 0.05; startY: 0
    PathLine{x: 0 ;y: height * 0.05 }
    PathLine{x: 0 ;y: height * 0.6 }
    PathLine{x: width * 0.05 ;y: height * 0.65 }
    PathLine{x: width * 0.05 ;y: height * 0.75 }
    PathLine{x: 0 ;y: height * 0.8 }
    PathLine{x: 0 ;y: height * 0.95 }
    PathLine{x: width * 0.05 ;y: height }
    PathLine{x: width * 0.9 ;y: height }
    PathLine{x: width * 0.95 ;y: height * 0.95 }
    PathLine{x: width * 0.95 ;y: height * 0.15 }
    PathLine{x: width * 0.85 ;y: 0 }
    PathLine{x: width * 0.05 ;y: 0 }
  }

  Shape{
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
      startX: width * 0.05; startY: 0
      PathLine{x: 0 ;y: height * 0.05 }
      PathLine{x: 0 ;y: height * 0.6 }
      PathLine{x: width * 0.05 ;y: height * 0.65 }
      PathLine{x: width * 0.05 ;y: height * 0.75 }
      PathLine{x: 0 ;y: height * 0.8 }
      PathLine{x: 0 ;y: height * 0.95 }
      PathLine{x: width * 0.05 ;y: height }
      PathLine{x: width * 0.9 ;y: height }
      PathLine{x: width * 0.95 ;y: height * 0.95 }
      PathLine{x: width * 0.95 ;y: height * 0.15 }
      PathLine{x: width * 0.85 ;y: 0 }
      PathLine{x: width * 0.05 ;y: 0 }
    }

    ShapePath {
      strokeWidth: 0
      fillColor: "white"
      startX: 0; startY:height * 0.08
      PathLine{x: width * 0.07; y: height * 0.02}
      PathLine{x: width * 0.84; y: height * 0.02}
      PathLine{x: width * 0.95; y: height * 0.18}
      PathLine{x: width * 0.95 ;y: height * 0.15 }
      PathLine{x: width * 0.85 ;y: 0 }
      PathLine{x: width * 0.05 ;y: 0 }
      PathLine{x: 0 ;y: height * 0.05 }
      PathLine{x: 0 ;y: height * 0.08 }
    }
  }

}
