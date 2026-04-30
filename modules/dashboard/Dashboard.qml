PanelWindow {
  implicitWidth: 400
  implicitHeight: Screen.height
  WlrLayershell.exclusiveZone: 0   // không chiếm không gian ứng dụng
  color: "transparent"
  WlrLayershell.layer: WlrLayer.Bottom
  anchors {
    right: true
    bottom: true
    top: true
  }
}
