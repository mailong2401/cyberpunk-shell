import QtQuick
import QtQuick.Layouts
import Quickshell
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects
import qs.components.layout.graphics

PanelWindow {
  implicitWidth: 350
  implicitHeight: 400
  focusable: true
  color: "red"

  anchors {
    top: true
    right: true
  }
  margins{
    top: 10
    right: 10
  }
  Graphic4{}
}
