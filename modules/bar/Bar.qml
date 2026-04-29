import QtQuick
import QtQuick.Layouts
import Quickshell
import qs.modules.bar
import qs.commons
import QtQuick.Shapes

PanelWindow {
  implicitWidth: Screen.width
  implicitHeight: 60
  color: "transparent"
  anchors {
    left: true
    right: true
    top: true
  }

  Draw{}

  Item {
    implicitWidth: parent.width;
    implicitHeight: 50

    RowLayout {
      anchors.fill: parent
      spacing: 15

      // ===== LEFT =====
      RowLayout {
        Layout.alignment: Qt.AlignVCenter

        Item { implicitWidth: 30 }

        LogoSection {}

        Item { implicitWidth: 15 }

        TitleSection {}
      }

      // ===== SPACER =====
      Item { Layout.fillWidth: true }

      // ===== CENTER =====
      CenterSection{}

      // ===== SPACER =====
      Item { Layout.fillWidth: true }

      // ===== RIGHT =====
      RightSection{}
      Item {implicitWidth:50}
    }
  }
}
