import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Shape {
  id: shape
  anchors.fill: parent

  Shape{
    layer.enabled: true
    layer.effect: Glow {
      radius: 24
      samples: 32
      color: "#5b2adc"
    }

    ShapePath {
      strokeWidth: 1
      strokeColor: "white"
      fillColor: "transparent"
      startX: width * 0.02; startY: height * 0.22
      PathLine{x: width * 0.15 ;y: height * 0.22}
      PathLine{x: width * 0.17 ;y: height * 0.12}
      PathLine{x: width * 0.278 ;y: height * 0.12}
    }
    ShapePath {
      strokeWidth: 1
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.278; startY: height * 0.12
      PathLine{x: width * 0.278 ;y: height * 0.22}
      PathLine{x: width * 0.29 ;y: height * 0.22}
      PathLine{x: width * 0.29 ;y: height * 0.12}
      PathLine{x: width * 0.278 ;y: height * 0.12}
    }
    ShapePath {
      strokeWidth: 1
      strokeColor: "white"
      fillColor: "transparent"
      startX: width * 0.98; startY: height * 0.12
      PathLine{x: width * 0.85 ;y: height * 0.12}
      PathLine{x: width * 0.83 ;y: height * 0.22}
      PathLine{x: width * 0.722 ;y: height * 0.22}
    }
    ShapePath {
      strokeWidth: 1
      strokeColor: "white"
      fillColor: "white"
      startX: width * 0.722; startY: height * 0.12
      PathLine{x: width * 0.722 ;y: height * 0.22}
      PathLine{x: width * 0.71 ;y: height * 0.22}
      PathLine{x: width * 0.71 ;y: height * 0.12}
      PathLine{x: width * 0.722 ;y: height * 0.12}
    }

  }
  Shape {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    ShapePath {

      strokeWidth: 2
      strokeColor: "white"
      fillColor: "transparent"
      startX: width * 0.3; startY: height * 0.22
      PathLine{x: width * 0.5 ;y: height * 0.22}
      PathLine{x: width * 0.53 ;y: height * 0.23}
      PathLine{x: width * 0.68 ;y: height * 0.23}
      PathLine{x: width * 0.7 ;y: height * 0.21}

    }
    ShapePath {

      strokeWidth: 1
      strokeColor: "#5b2adc"
      fillColor: "transparent"
      startX: width * 0.3; startY: height * 0.12
      PathLine{x: width * 0.7 ;y: height * 0.12}
    }

  }

}
