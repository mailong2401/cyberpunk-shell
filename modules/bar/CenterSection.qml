import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

RowLayout {
  Layout.alignment: Qt.AlignCenter
  Layout.bottomMargin: 10
  spacing: 30

  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/folder"
    asynchronous: true
  }

  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/firefox"
    asynchronous: true
  }
  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/spotify"
    asynchronous: true
  }
  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/code"
    asynchronous: true
  }
  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/discord"
    asynchronous: true
  }
  Image {
    Layout.preferredWidth: 32
    Layout.preferredHeight: 32
    fillMode: Image.PreserveAspectFit
    source:"image://icon/telegram"
    asynchronous: true
  }

}
