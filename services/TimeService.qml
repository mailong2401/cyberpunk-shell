pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell

Singleton {
  id: root

  // Public properties
  readonly property date currentDate: clock.date
  readonly property int hours: clock.hours
  readonly property int minutes: clock.minutes
  readonly property int seconds: clock.seconds

  // Date components cho dễ sử dụng
  readonly property int day: currentDate.getDate()
  readonly property int month: currentDate.getMonth()
  readonly property int year: currentDate.getFullYear()
  readonly property int dayOfWeek: currentDate.getDay()

  // Day and month labels - đủ cho cả 2 component
  readonly property var weekdayLabels: ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
  readonly property var weekdayShortLabels: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
  readonly property var weekdayCapsLabels: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"] // Cho calendar
  readonly property var monthLabels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  readonly property var monthFullLabels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  readonly property var monthCapsLabels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"] // Cho calendar

  // Configuration properties
  property bool enabled: true
  property bool is24HourFormat: true
  property string timeFormat: "hh:mm"
  property string dateFormat: "yyyy-MM-dd"

  // Private clock instance
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
    enabled: root.enabled
  }

  // Initialize function
  function init(config = ({})) {
    if (config.precision !== undefined) {
      setPrecision(config.precision)
    }
    if (config.enabled !== undefined) {
      setEnabled(config.enabled)
    }
    if (config.timeFormat !== undefined) {
      root.timeFormat = config.timeFormat
    }
    if (config.dateFormat !== undefined) {
      root.dateFormat = config.dateFormat
    }
    if (config.is24HourFormat !== undefined) {
      root.is24HourFormat = config.is24HourFormat
    }
    if (config.onInitialized && typeof config.onInitialized === "function") {
      config.onInitialized(root)
    }
    console.log("TimeService initialized")
    return root
  }

  // Basic getters - cho DateTimePanel
  function getTimeString() {
    if (is24HourFormat) {
      return Qt.formatDateTime(clock.date, timeFormat)
    } else {
      let hours12 = clock.hours % 12
      if (hours12 === 0) hours12 = 12
      const ampm = clock.hours >= 12 ? "PM" : "AM"
      return `${String(hours12).padStart(2, "0")}:${String(clock.minutes).padStart(2, "0")} ${ampm}`
    }
  }

  function getDateString() {
    return `${getDayOfMonth()} ${getMonth()}, ${getYear()}`
  }

  function getDayString() {
    return getWeekday()
  }

  // Date component getters - cho cả 2 component
  function getWeekday(dateObj = clock.date) {
    return weekdayLabels[dateObj.getDay()]
  }

  function getShortWeekday(dateObj = clock.date) {
    return weekdayShortLabels[dateObj.getDay()]
  }

  function getCapsWeekday(dateObj = clock.date) {
    return weekdayCapsLabels[dateObj.getDay()]
  }

  function getMonth(dateObj = clock.date) {
    return monthLabels[dateObj.getMonth()]
  }

  function getFullMonth(dateObj = clock.date) {
    return monthFullLabels[dateObj.getMonth()]
  }

  function getCapsMonth(dateObj = clock.date) {
    return monthCapsLabels[dateObj.getMonth()]
  }

  function getDayOfMonth(dateObj = clock.date) {
    return dateObj.getDate()
  }

  function getYear(dateObj = clock.date) {
    return dateObj.getFullYear()
  }

  function getMonthIndex(dateObj = clock.date) {
    return dateObj.getMonth()
  }

  // Helper functions cho calendar
  function getDaysInMonth(month, year) {
    var days = [];
    var firstDay = new Date(year, month, 1);
    var lastDay = new Date(year, month + 1, 0);
    var startingDay = firstDay.getDay();
    var today = new Date();

    // Previous month days
    var prevMonthLastDay = new Date(year, month, 0).getDate();
    for (var i = 0; i < startingDay; i++) {
      days.push({
          day: prevMonthLastDay - startingDay + i + 1,
          isCurrentMonth: false,
          isToday: false,
          fullDate: new Date(year, month - 1, prevMonthLastDay - startingDay + i + 1)
      });
    }

    // Current month days
    for (var j = 1; j <= lastDay.getDate(); j++) {
      var isToday = today.getDate() === j && today.getMonth() === month && today.getFullYear() === year;
      days.push({
          day: j,
          isCurrentMonth: true,
          isToday: isToday,
          fullDate: new Date(year, month, j)
      });
    }

    // Next month days
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

  // Check functions
  function isToday(dateObj) {
    const today = new Date()
    return dateObj.toDateString() === today.toDateString()
  }

  // Property setters
  function setPrecision(precision) {
    if (precision === SystemClock.Hours ||
      precision === SystemClock.Minutes ||
      precision === SystemClock.Seconds) {
      clock.precision = precision
    }
  }

  function setEnabled(isEnabled) {
    clock.enabled = isEnabled
    root.enabled = isEnabled
  }

  // Internal connections
  Connections {
    target: clock
    function onDateChanged() {
      const currentDay = clock.date.getDate()
      const currentMonth = clock.date.getMonth()
      const currentYear = clock.date.getFullYear()

      if (currentDay !== oldDay) root.dayChanged()
      if (currentMonth !== oldMonth) root.monthChanged()
      if (currentYear !== oldYear) root.yearChanged()

      oldSeconds = clock.seconds
      oldMinutes = clock.minutes
      oldHours = clock.hours
      oldDay = currentDay
      oldMonth = currentMonth
      oldYear = currentYear
    }
  }

  // Private variables
  property int oldSeconds: -1
  property int oldMinutes: -1
  property int oldHours: -1
  property int oldDay: -1
  property int oldMonth: -1
  property int oldYear: -1
}
