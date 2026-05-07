pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects
import qs.components.layout.graphics
import qs.services

Rectangle {
  id: calendarPanel
  color: "transparent"
  implicitHeight: 370
  implicitWidth: parent.width
  radius: 16

  property date selectedDate: new Date()

  // Sử dụng TimeService
  property var timeService: TimeService

  // Current month/year từ TimeService
  property int currentMonth: timeService.getMonthIndex(selectedDate)
  property int currentYear: selectedDate.getFullYear()

  Graphic4{}

  signal dateSelected(date selectedDate)

  ColumnLayout {
    anchors.fill: parent
    anchors.margins: 30
    spacing: 10

    // Header
    Text {
      text: "CALENDAR"
      color: "white"
      font { bold: true; pixelSize: 18; letterSpacing: 2 }
      layer.enabled: true
      layer.effect: Glow {
        radius: 6
        samples: 12
        color: "#831C91"
        spread: 0.3
      }
    }

    // Month navigation
    RowLayout {
      Layout.fillWidth: true
      spacing: 15

      // Previous month button
      Rectangle {
        implicitWidth: 36
        implicitHeight: 36
        radius: 8
        color: prevMouse.pressed ? "#831C91" : (prevMouse.containsMouse ? "#2a2a2a" : "transparent")

        Text {
          text: "◀"
          anchors.centerIn: parent
          color: "white"
          font.pixelSize: 18
          font.family: "ComicShannsMono Nerd Font"
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }

        MouseArea {
          id: prevMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: previousMonth()
        }
      }

      // Month and Year display - Dùng TimeService
      Text {
        text: timeService.getCapsMonth(new Date(currentYear, currentMonth, 1)) + " " + currentYear
        color: "#ffffff"
        font {
          bold: true
          pixelSize: 24
          letterSpacing: 3
          family: "ComicShannsMono Nerd Font"
        }
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
        layer.enabled: true
        layer.effect: Glow {
          radius: 12
          samples: 25
          color: "#5b2adc"
        }
      }

      // Next month button
      Rectangle {
        implicitWidth: 36
        implicitHeight: 36
        radius: 8
        color: nextMouse.pressed ? "#831C91" : (nextMouse.containsMouse ? "#2a2a2a" : "transparent")

        Text {
          text: "▶"
          anchors.centerIn: parent
          color: "white"
          font.pixelSize: 18
          font.family: "ComicShannsMono Nerd Font"
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
        }

        MouseArea {
          id: nextMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: nextMonth()
        }
      }
    }

    // Calendar grid
    GridLayout {
      Layout.fillWidth: true
      Layout.fillHeight: true
      columns: 7
      rowSpacing: 4
      columnSpacing: 4

      // Week day headers - Dùng TimeService
      Repeater {
        model: timeService.weekdayCapsLabels

        Text {
          text: modelData
          color: "#831C91"
          font {
            bold: true
            pixelSize: 12
            letterSpacing: 1
            family: "ComicShannsMono Nerd Font"
          }
          horizontalAlignment: Text.AlignHCenter
          Layout.fillWidth: true
          Layout.preferredHeight: 30
          layer.enabled: true
          layer.effect: Glow {
            radius: 2
            samples: 6
            color: "#831C91"
            spread: 0.2
          }
        }
      }

      // Days - Dùng TimeService
      Repeater {
        id: daysRepeater
        model: timeService.getDaysInMonth(currentMonth, currentYear)

        Rectangle {
          id: dayRect
          Layout.preferredWidth: 36
          Layout.preferredHeight: 36
          Layout.fillWidth: true

          required property var modelData

          color: {
            if (modelData.isToday && modelData.isCurrentMonth)
            return "#831C91"
            else
            return "transparent"
          }

          radius: 18

          Text {
            text: modelData.day
            anchors.centerIn: parent
            color: {
              if (!modelData.isCurrentMonth)
              return "#555555"
              else if (modelData.isToday)
              return "white"
              else
              return "#cccccc"
            }
            font {
              bold: modelData.isToday || modelData.fullDate.toDateString() === selectedDate.toDateString()
              pixelSize: 14
              family: "ComicShannsMono Nerd Font"
            }

            layer.enabled: modelData.isCurrentMonth && !modelData.isToday
            layer.effect: Glow {
              radius: 5
              samples: 25
              color: "#5b2adc"
            }
          }
        }
      }
    }
  }

  // Navigation functions
  function previousMonth() {
    if (currentMonth === 0) {
      currentMonth = 11
      currentYear--
    } else {
      currentMonth--
    }
    selectedDate = new Date(currentYear, currentMonth, 1)
  }

  function nextMonth() {
    if (currentMonth === 11) {
      currentMonth = 0
      currentYear++
    } else {
      currentMonth++
    }
    selectedDate = new Date(currentYear, currentMonth, 1)
  }

  function goToToday() {
    var today = new Date()
    currentMonth = today.getMonth()
    currentYear = today.getFullYear()
    selectedDate = today
    dateSelected(selectedDate)
  }
}
