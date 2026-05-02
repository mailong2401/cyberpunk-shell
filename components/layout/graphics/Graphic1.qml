import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent
  ShapePath {
    strokeWidth: 0
    fillColor: Qt.rgba(0.04, 0.04, 0.04, 0.8)

    startX: width *0.05; startY: 0
    PathLine { x: width; y: 0 }
    PathLine {x: width; y: height * 0.7}
    PathLine {x: width * 0.95; y: height * 0.9}
    PathLine {x: 0; y : height * 0.9}
    PathLine {x: 0; y : height * 0.2}
    PathLine {x: width * 0.05; y : 0}
  }
  Shape {
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

      startX: width *0.05; startY: 0
      PathLine { x: width; y: 0 }
      PathLine {x: width; y: height * 0.7}
      PathLine {x: width * 0.95; y: height * 0.9}
      PathLine {x: 0; y : height * 0.9}
      PathLine {x: 0; y : height * 0.2}
      PathLine {x: width * 0.05; y : 0}

    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "transparent"
      startX: width *0.1; startY: height * 0.9
      PathLine {x: width * 0.09; y : height * 0.94}
      PathLine {x: width * 0.5; y : height * 0.94}
      PathLine {x: width * 0.52; y : height * 0.96}
      PathLine {x: width * 0.6; y : height * 0.96}
    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.6; startY: height * 0.96
      PathLine {x: width * 0.62; y : height * 0.93}
      PathLine {x: width * 0.77; y : height * 0.93}
      PathLine {x: width * 0.75; y : height * 0.96}
      PathLine {x: width * 0.7; y : height * 0.96}
      PathLine {x: width * 0.68; y : height * 0.98}
      PathLine {x: width * 0.62; y : height * 0.98}
      PathLine {x: width * 0.64; y : height * 0.96}

    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.8; startY : height * 0.93
      PathLine {x:width * 0.88 ; y: height * 0.93}
      PathLine {x:width * 0.86 ; y: height * 0.96}
      PathLine {x:width * 0.78 ; y: height * 0.96}
      PathLine {x:width * 0.8 ; y: height * 0.93}
    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.9; startY : height * 0.93
      PathLine {x:width * 0.93 ; y: height * 0.93}
      PathLine {x:width * 0.91 ; y: height * 0.96}
      PathLine {x:width * 0.88 ; y: height * 0.96}
      PathLine {x:width * 0.9 ; y: height * 0.93}
    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "transparent"
      startX: width * 0.046; startY: height * 0.02
      PathLine { x: width * 0.06; y: height * 0.02 }
      PathLine { x: width * 0.2; y: height * 0.02 }
      PathLine { x: width * 0.22; y: height * 0.04 }
      PathLine { x: width * 0.85; y: height * 0.04 }
      PathLine { x: width * 0.9; y: height * 0.15 }
      PathLine { x: width * 0.99; y: height * 0.15 }

    }

    ShapePath {
      strokeWidth: 2
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.86; startY: height * 0.03
      PathLine { x: width * 0.905; y: height * 0.13 }
      PathLine { x: width * 0.99; y: height * 0.13 }
      PathLine { x: width * 0.99; y: height * 0.03 }
      PathLine { x: width * 0.86; y: height * 0.03 }

    }
  }

}
