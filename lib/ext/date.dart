extension DateExtensions on DateTime {
  /// If value is NULL returns [Null]
  /// Else returns the difference between current date and the object in days
  /// excluding the the time values
  ///
  int get dayDifference {
    DateTime now = DateTime.now();
    return DateTime(year, month, day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;
  }

  /// Returns the [bool] wheather the given date are inside iterval or not.
  ///
  /// Example:
  /// ```dart
  /// DateTime(2000, 1, 2).isBetween(DateTime(2000, 1, 1), DateTime(2000, 1, 31)); // true
  /// DateTime(2000, 1, 1).isBetween(DateTime(2000, 1, 1), DateTime(2000, 1, 1)); // true
  /// ```
  bool isBetween(DateTime from, DateTime to) {
    return (isAfter(from) && isBefore(to)) || this == from || this == to;
  }

  /// Returns an ISO-8601 full-precision extended format representation.
  ///
  String toServerFormat() => toUtc().toIso8601String();

  /// return true if the date is today
  ///
  bool get isToday => dayDifference == 0;

  /// return true if the date is Yesterday
  ///
  bool get isYesterday => dayDifference == -1;

  /// return true if the date is Tomorrow
  ///
  bool get isTomorrow => dayDifference == 1;

  /// next day
  DateTime tomorrow() => DateTime(year, month, day + 1);

  /// previous day
  DateTime yesterday() => DateTime(year, month, day - 1);

  /// Adds this DateTime and Duration and returns the sum as a new DateTime object.
  DateTime operator +(Duration duration) => add(duration);

  /// Subtracts the Duration from this DateTime returns the difference as a new DateTime object.
  DateTime operator -(Duration duration) => subtract(duration);

  /// Returns true if [other] is in the same year as [this].
  ///
  /// Does not account for timezones.
  bool isAtSameYearAs(DateTime other) => year == other.year;

  /// Returns true if [other] is in the same month as [this].
  ///
  /// This means the exact month, including year.
  ///
  /// Does not account for timezones.
  bool isAtSameMonthAs(DateTime other) =>
      isAtSameYearAs(other) && month == other.month;

  /// Returns true if [other] is on the same day as [this].
  ///
  /// This means the exact day, including year and month.
  ///
  /// Does not account for timezones.
  bool isAtSameDayAs(DateTime other) =>
      isAtSameMonthAs(other) && day == other.day;

  /// Returns true if [other] is at the same hour as [this].
  ///
  /// This means the exact hour, including year, month and day.
  ///
  /// Does not account for timezones.
  bool isAtSameHourAs(DateTime other) =>
      isAtSameDayAs(other) && hour == other.hour;

  /// Returns true if [other] is at the same minute as [this].
  ///
  /// This means the exact minute, including year, month, day and hour.
  ///
  /// Does not account for timezones.
  bool disAtSameMinuteAs(DateTime other) =>
      isAtSameHourAs(other) && minute == other.minute;

  /// Returns true if [other] is at the same minute as [this].
  ///
  /// This means the exact minute, including year, month, day and hour.
  ///
  /// Does not account for timezones.
  bool isAtSameMinuteAs(DateTime other) =>
      isAtSameHourAs(other) && minute == other.minute;

  /// Returns true if [other] is at the same second as [this].
  ///
  /// This means the exact second, including year, month, day, hour and minute.
  ///
  /// Does not account for timezones.
  bool isAtSameSecondAs(DateTime other) =>
      isAtSameMinuteAs(other) && second == other.second;

  /// Returns true if [other] is at the same millisecond as [this].
  ///
  /// This means the exact millisecond,
  /// including year, month, day, hour, minute and second.
  ///
  /// Does not account for timezones.
  bool isAtSameMillisecondAs(DateTime other) =>
      isAtSameSecondAs(other) && millisecond == other.millisecond;

  /// Returns true if [other] is at the same microsecond as [this].
  ///
  /// This means the exact microsecond,
  /// including year, month, day, hour, minute, second and millisecond.
  ///
  /// Does not account for timezones.
  bool isAtSameMicrosecondAs(DateTime other) =>
      isAtSameMillisecondAs(other) && microsecond == other.microsecond;

  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth, this);

  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth, this);

  DateTime get firstDayOfMonth => DateTime(this.year, this.month);

  /// The last day of a given month
  DateTime get lastDayOfMonth {
    var beginningNextMonth = (this.month < 12)
        ? DateTime(this.year, this.month + 1, 1)
        : DateTime(this.year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  /// The list of days in a given month
  List<DateTime> get daysInMonth {
    var first = firstDayOfMonth;
    var daysBefore = first.weekday;
    var firstToDisplay = first.subtract(Duration(days: daysBefore));
    var last = lastDayOfMonth;

    var daysAfter = 7 - last.weekday;

    // If the last day is sunday (7) the entire week must be rendered
    if (daysAfter == 0) {
      daysAfter = 7;
    }

    var lastToDisplay = last.add(Duration(days: daysAfter));
    return daysInRange(firstToDisplay, lastToDisplay).toList();
  }

  /// Returns a [DateTime] for each day the given range.
  ///
  /// [start] inclusive
  /// [end] exclusive
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.add(Duration(days: 1));
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// to add years to a [DateTime] add a positive number
  /// to remove years pass a negative number
  addOrRemoveYears(int years) {
    return DateTime(year + years, month, day, minute, second);
  }

  /// to add month to a [DateTime] add a positive number
  /// to remove years pass a negative number
  addOrRemoveMonth(int months) {
    return DateTime(year, month + months, day, minute, second);
  }

  /// to add days to a [DateTime] add a positive number
  /// to remove days pass a negative number
  addOrRemoveDay(int days) {
    return DateTime(year, month, day + days, minute, second);
  }

  /// to add min to a [DateTime] add a positive number
  /// to remove min pass a negative number
  addOrRemoveMinutes(int min) {
    return DateTime(year, month, day, minute + min, second);
  }

  /// to add sec to a [DateTime] add a positive number
  /// to remove sec pass a negative number
  addOrRemoveSeconds(int sec) {
    return DateTime(year, month, day, minute, second + sec);
  }

  ///  Start time of Date times
  DateTime startOfDay() => DateTime(year, month, day);

  DateTime startOfMonth() => DateTime(year, month);

  DateTime startOfYear() => DateTime(year);

  /// return the smaller date between
  DateTime min(DateTime that) =>
      (millisecondsSinceEpoch < that.millisecondsSinceEpoch) ? this : that;

  DateTime max(DateTime that) =>
      (millisecondsSinceEpoch > that.millisecondsSinceEpoch) ? this : that;

  bool get isLeapYear =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
