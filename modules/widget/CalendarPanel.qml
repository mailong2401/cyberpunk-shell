pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Qt5Compat.GraphicalEffects
import  qs.components.layout.graphics

Rectangle {
  id: calendarPanel

  property date currentDate: new Date()
  property int currentMonth: currentDate.getMonth()
  property int currentYear: currentDate.getFullYear()
  property date selectedDate: new Date()

  Graphic4{}

  color: "transparent"
  implicitHeight: 370
  implicitWidth: parent.width
  radius: 16

  signal dateSelected(date selectedDate)

  // Fixed labels for cyberpunk style
  readonly property var weekdayLabels: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
  readonly property var monthLabels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

  ColumnLayout {
    anchors.fill: parent
    anchors.leftMargin: 30
    anchors.bottomMargin: 50
    anchors.topMargin: 30
    anchors.rightMargin: 30
    spacing: 3

    // Header: CALENDAR title
    Text {
      text: "CALENDAR"
      color: "white"
      font {
        bold: true
        pixelSize: 18
        letterSpacing: 2
      }

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
          layer.enabled: true
          layer.effect: Glow {
            radius: 12
            samples: 25
            color: "#5b2adc"
          }
          text: "◀"
          anchors.centerIn: parent
          color: "white"
          font.pixelSize: 18
          font.family: "ComicShannsMono Nerd Font"
        }

        MouseArea {
          id: prevMouse
          anchors.fill: parent
          hoverEnabled: true
          cursorShape: Qt.PointingHandCursor
          onClicked: previousMonth()
        }
      }

      // Month and Year display
      Text {
        text: monthLabels[currentMonth] + " " + currentYear
        color: "#ffffff"
        layer.enabled: true
        layer.effect: Glow {
          radius: 12
          samples: 25
          color: "#5b2adc"
        }
        font {
          bold: true
          pixelSize: 24
          letterSpacing: 3
          family: "ComicShannsMono Nerd Font"
        }
        Layout.fillWidth: true
        horizontalAlignment: Text.AlignHCenter
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
      id: calendarGrid
      Layout.fillWidth: true
      Layout.fillHeight: true
      columns: 7
      rowSpacing: 2
      columnSpacing: 2

      // Week day headers
      Repeater {
        model: weekdayLabels

        Text {
          text: modelData
          color: "#831C91"
          font {
            bold: true
            pixelSize: 13
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

      // Days - GIỮ NGUYÊN CÁCH GỌI FUNCTION TRỰC TIẾP
      Repeater {
        id: daysRepeater
        model: getDaysInMonth(currentMonth, currentYear)  // <- QUAN TRỌNG: Gọi trực tiếp

        Rectangle {
          id: dayRect
          Layout.preferredWidth: 36
          Layout.preferredHeight: 36
          Layout.fillWidth: true

          required property var modelData  // Thêm dòng này

          color: {
            if (modelData.isToday && modelData.isCurrentMonth)
            return "#831C91";
            else if (modelData.fullDate.toDateString() === selectedDate.toDateString() && modelData.isCurrentMonth)
            return Qt.rgba(0.51, 0.11, 0.57, 0.5);
            else
            return "transparent";
          }
          radius: 18
          border.color: (modelData.isCurrentMonth && modelData.fullDate.toDateString() === selectedDate.toDateString()) ? "#831C91" : "transparent"
          border.width: 1

          Text {
            text: modelData.day
            anchors.centerIn: parent
            layer.enabled: modelData.isCurrentMonth
            layer.effect: Glow {
              radius: 5
              samples: 25
              color: "#5b2adc"
            }
            color: {
              if (!modelData.isCurrentMonth)
              return "#555555";
              else if (modelData.isToday)
              return "white";
              else if (modelData.fullDate.toDateString() === selectedDate.toDateString())
              return "#831C91";
              else
              return "#cccccc";
            }
            font {
              bold: modelData.isToday || modelData.fullDate.toDateString() === selectedDate.toDateString()
              pixelSize: 14
              family: "ComicShannsMono Nerd Font"
            }
          }

          MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked: {
              if (modelData.isCurrentMonth) {
                selectedDate = modelData.fullDate;
                calendarPanel.dateSelected(selectedDate);
              }
            }

            onContainsMouseChanged: {
              if (containsMouse && modelData.isCurrentMonth) {
                dayRect.border.width = 2;
                dayRect.border.color = "#831C91";
              } else if (modelData.fullDate.toDateString() !== selectedDate.toDateString()) {
                dayRect.border.width = 0;
              }
            }
          }
        }
      }
    }
  }

  // Helper functions
  function getDaysInMonth(month, year) {
    var days = [];
    var firstDay = new Date(year, month, 1);
    var lastDay = new Date(year, month + 1, 0);
    var startingDay = firstDay.getDay();

    // Ngày từ tháng trước
    var prevMonthLastDay = new Date(year, month, 0).getDate();
    for (var i = 0; i < startingDay; i++) {
      days.push({
          day: prevMonthLastDay - startingDay + i + 1,
          isCurrentMonth: false,
          isToday: false,
          fullDate: new Date(year, month - 1, prevMonthLastDay - startingDay + i + 1)
      });
    }

    // Ngày của tháng hiện tại
    var today = new Date();
    for (var j = 1; j <= lastDay.getDate(); j++) {
      var isToday = today.getDate() === j && today.getMonth() === month && today.getFullYear() === year;
      days.push({
          day: j,
          isCurrentMonth: true,
          isToday: isToday,
          fullDate: new Date(year, month, j)
      });
    }

    // Ngày từ tháng sau
    var totalCells = 42;
    var nextMonthDay = 1;
    while (days.length < totalCells) {
      days.push({
          day: nextMonthDay,
          isCurrentMonth: false,
          isToday: false,
          fullDate: new Date(year, month + 1, nextMonthDay)
      });
      nextMonthDay++;
    }

    return days;
  }

  function previousMonth() {
    currentMonth--;
    if (currentMonth < 0) {
      currentMonth = 11;
      currentYear--;
    }
    currentDate = new Date(currentYear, currentMonth, 1);
    // Model tự động update vì binding với function
  }

  function nextMonth() {
    currentMonth++;
    if (currentMonth > 11) {
      currentMonth = 0;
      currentYear++;
    }
    currentDate = new Date(currentYear, currentMonth, 1);
    // Model tự động update vì binding với function
  }

  function goToToday() {
    currentDate = new Date();
    currentMonth = currentDate.getMonth();
    currentYear = currentDate.getFullYear();
    selectedDate = new Date();
    // Model tự động update vì binding với function
  }
}
