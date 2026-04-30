import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

Item {
  width: 55
  height: 55

  property bool hovered: false

  Image {
    anchors.fill: parent

    layer.enabled: true
    layer.effect: Glow {
      radius: hovered ? 16 : 3
      samples: 16
      color: "#831C91"

    }

    source: "../../assets/images/logo/logo.png"
    fillMode: Image.PreserveAspectFit
  }

  MouseArea {
    anchors.fill: parent
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onClicked: {
    }
    onEntered: hovered = true
    onExited: hovered = false
  }
}
