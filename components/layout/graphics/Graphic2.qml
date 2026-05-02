import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent
  layer.enabled: true
  layer.effect: Glow {
    radius: 12
    samples: 25
    color: "#5b2adc"
  }
  ShapePath {
    strokeWidth: 0
    strokeColor: "white"
    fillColor: "white"

    startX: 0; startY: height * 0.05
    PathLine{x: 0;y: height * 0.95 }
    PathLine{x: width * 0.05;y: height }
    PathLine{x: width * 0.15;y: height }
    PathLine{x: width * 0.15;y: height * 0.85 }
    PathLine{x: width * 0.12;y: height * 0.82 }
    PathLine{x: width * 0.12;y: height * 0.2 }
    PathLine{x: width * 0.15;y: height * 0.17 }
    PathLine{x: width * 0.15;y: 0 }
    PathLine{x: width * 0.08;y: 0 }
    PathLine{x: width * 0.04;y: height * 0.05 }
  }
  ShapePath {
    strokeWidth: 2
    strokeColor: "white"
    fillColor: "transparent"
    startX: width * 0.2; startY: height * 0.05
    PathLine{x: width * 0.25;y: 0 }
    PathLine{x: width * 0.8;y: 0 }
    PathLine{x: width * 0.83;y: height * 0.1 }
    PathLine{x: width;y: height * 0.1 }
    PathLine{x: width;y: height * 0.95 }
    PathLine{x: width * 0.95;y: height }
    PathLine{x: width * 0.2;y: height }
    PathLine{x: width * 0.2;y: height * 0.05 }
  }

  ShapePath {
    strokeWidth: 0
    strokeColor: "white"
    fillColor: "white"

    startX: width * 0.86; startY: height * 0.08
    PathLine{x: width * 0.83;y: 0 }
    PathLine{x: width * 0.9;y: 0 }
    PathLine{x: width * 0.93;y: height * 0.08 }
    PathLine{x: width * 0.86;y: height * 0.08 }
  }
  ShapePath {
    strokeWidth: 0
    strokeColor: "white"
    fillColor: "white"

    startX: width * 0.92; startY: 0
    PathLine{x: width * 0.95;y: 0 }
    PathLine{x: width * 0.98;y: height * 0.08 }
    PathLine{x: width * 0.95;y: height * 0.08 }
    PathLine{x: width * 0.92;y: 0 }
  }

  ShapePath {
    strokeWidth: 3
    strokeColor: "white"
    fillColor: "white"

    startX: width * 0.97; startY: 0
    PathLine{x: width;y: height * 0.08 }

  }

  ShapePath {
    strokeWidth: 0
    strokeColor: "white"
    fillColor: "white"

    startX: width * 0.2; startY: 0
    PathLine{x: width * 0.23;y: 0 }
    PathLine{x: width * 0.2 ;y: height * 0.03 }
    PathLine{x: width * 0.2 ;y: 0 }

  }

  ShapePath {
    strokeWidth: 0
    strokeColor: "white"
    fillColor: "white"

    startX: width; startY: height
    PathLine{x: width * 0.98;y: height }
    PathLine{x: width;y: height * 0.97 }
    PathLine{x: width;y: height }

  }

}
