import 'package:intl/intl.dart';

/// Returns the word day of the week when given a number.
String formatWeekday(int weekdayNum) {
  switch (weekdayNum) {
    case 0: { return "Sunday"; }
    break;
    case 1: { return "Monday"; }
    break;
    case 2: { return "Tuesday"; }
    break;
    case 3: { return "Wednesday"; }
    break;
    case 4: { return "Thursday"; }
    break;
    case 5: { return "Friday"; }
    break;
    default: { return "Saturday"; }
    break;
  }
}

/// Formats DateTime objects as a timespan (HH:mm - HH:mm)
String formatStartAndEnd(DateTime startTime, DateTime endTime) {
  return "${DateFormat('kk:mm').format(startTime)} - ${DateFormat('kk:mm').format(endTime)}";
}

/// Converts a String yyyymmdd to a DateTime object - from https://github.com/mitchkoko/HabitTrackerFlutter/blob/main/lib/datetime/date_time.dart
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

/// Converts a DateTime object into a String yyyymmdd
String convertDateTimeToString(DateTime datetime) {
  return DateFormat('yyyyMMdd').format(datetime);
}