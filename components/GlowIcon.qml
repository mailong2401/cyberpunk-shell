// GlowIcon.qml
import QtQuick
import Qt5Compat.GraphicalEffects

Text {
  property color glowColor: "#5b2adc"
  property int glowRadius: 12
  property int glowSamples: 25

  layer.enabled: true
  layer.effect: Glow {
    radius: glowRadius
    samples: glowSamples
    color: glowColor
  }

  color: "white"
  font.family: "Material Symbols Rounded"

}
