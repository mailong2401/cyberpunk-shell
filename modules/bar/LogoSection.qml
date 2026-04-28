import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

Image {

  layer.enabled: true
  layer.effect: Glow {
    radius: 6
    samples: 16
    color: "#FF70BF"
  }

  source: "../../assets/images/logo/logo.png"
  Layout.preferredWidth: 55
  Layout.preferredHeight: 55
  fillMode: Image.PreserveAspectFit

}
