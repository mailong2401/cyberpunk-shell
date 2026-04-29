import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects

RowLayout {
  Layout.alignment: Qt.AlignVCenter
  Layout.bottomMargin: 10
  spacing: 20

  // CPU Usage
  RowLayout {
    spacing: 8
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 10
        samples: 16
        color: "#831C91"
      }
      font.family: cyberFont.name
      text: "CPU"
      color: "white"
      font.pixelSize: 18
    }
    Text {
      text: "23%"
      color: "white"
      font.family: cyberFont.name

      font.pixelSize: 18
      font.bold: true
    }
  }

  // RAM Usage
  RowLayout {
    spacing: 8
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 10
        samples: 16
        color: "#831C91"
      }
      font.family: cyberFont.name

      text: "RAM"
      color: "white"
      font.pixelSize: 18
    }
    Text {
      text: "48%"
      font.family: cyberFont.name

      color: "white"
      font.pixelSize: 18
      font.bold: true
    }
  }

  // GPU Usage
  RowLayout {
    spacing: 8
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 10
        samples: 16
        color: "#831C91"
      }
      font.family: cyberFont.name

      text: "GPU"
      color: "white"
      font.pixelSize: 18
    }
    Text {
      text: "67%"
      color: "white"
      font.family: cyberFont.name

      font.pixelSize: 18
      font.bold: true
    }
  }

  // SSD Usage
  RowLayout {
    spacing: 8
    Text {
      layer.enabled: true
      layer.effect: Glow {
        radius: 10
        samples: 16
        color: "#831C91"
      }
      font.family: cyberFont.name

      text: "SSD"
      color: "white"
      font.pixelSize: 18
    }
    Text {
      text: "72%"
      color: "white"
      font.family: cyberFont.name
      font.pixelSize: 18
      font.bold: true
    }
  }
  Item {implicitWidth:50}

  // WiFi Icon
  Text {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    font.family: "Material Symbols Rounded"
    text: "wifi"
    font.pixelSize: 30
    color: "white"
  }

  // Volume Icon
  Text {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    font.family: "Material Symbols Rounded"
    text: "volume_up"
    font.pixelSize: 30
    color: "white"
  }

  // Brightness Icon
  Text {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    font.family: "Material Symbols Rounded"
    text: "brightness_7"
    font.pixelSize: 30
    color: "white"
  }

  // Power Icon
  Text {
    layer.enabled: true
    layer.effect: Glow {
      radius: 12
      samples: 16
      color: "#831C91"
    }
    font.family: "Material Symbols Rounded"
    text: "power_settings_new"
    font.pixelSize: 30
    color: "white"
  }
}
