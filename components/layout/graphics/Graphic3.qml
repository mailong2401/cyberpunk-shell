import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent

  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)

    startX: width * 0.27; startY: height * 0.02
    PathLine { x: width * 0.12; y: height * 0.02 }
    PathLine { x: width * 0.07; y: height * 0.13 }
    PathLine { x: width * 0.07; y: height * 0.93 }
    PathLine { x: width * 0.88; y: height * 0.93 }
    PathLine { x: width * 0.93; y: height * 0.78 }
    PathLine { x: width * 0.93; y: height * 0.02 }
    PathLine { x: width * 0.48; y:  height * 0.02 }
  }

  Shape {
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
      startX: width * 0.25; startY: 0
      PathLine{x: width * 0.1;y: 0 }
      PathLine{x: width * 0.05;y: height * 0.15 }
      PathLine{x: width * 0.05;y: height * 0.95 }
      PathLine{x: width * 0.9;y: height * 0.95 }
      PathLine{x: width * 0.95;y: height * 0.8 }
      PathLine{x: width * 0.95;y: 0 }
      PathLine{x: width * 0.5;y: 0 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.05 ; startY: height * 0.7
      PathLine{x: width * 0.02;y: height * 0.75 }
      PathLine{x: width * 0.02;y: height * 0.98 }
      PathLine{x: width * 0.3;y: height * 0.98 }
      PathLine{x: width * 0.25;y: height * 0.95}
      PathLine{x: width * 0.05;y: height * 0.95}
      PathLine{x: width * 0.05;y: height * 0.7}
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.1
      PathLine{x: width * 0.97;y: height * 0.08 }
      PathLine{x: width * 0.97;y: height * 0.12 }
      PathLine{x: width;y: height * 0.1 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.16
      PathLine{x: width * 0.97;y: height * 0.14 }
      PathLine{x: width * 0.97;y: height * 0.18 }
      PathLine{x: width;y: height * 0.16 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.22
      PathLine{x: width * 0.97;y: height * 0.20 }
      PathLine{x: width * 0.97;y: height * 0.24 }
      PathLine{x: width;y: height * 0.22 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.28
      PathLine{x: width * 0.97;y: height * 0.26 }
      PathLine{x: width * 0.97;y: height * 0.30 }
      PathLine{x: width;y: height * 0.28 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.34
      PathLine{x: width * 0.97;y: height * 0.32 }
      PathLine{x: width * 0.97;y: height * 0.36 }
      PathLine{x: width;y: height * 0.34 }
    }

    ShapePath {
      strokeWidth: 0
      strokeColor: "white"
      fillColor: "white"
      startX: width ; startY: height * 0.4
      PathLine{x: width * 0.97;y: height * 0.38 }
      PathLine{x: width * 0.97;y: height * 0.42 }
      PathLine{x: width;y: height * 0.4 }
    }

  }
}
