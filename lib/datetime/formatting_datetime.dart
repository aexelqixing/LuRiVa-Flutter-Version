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