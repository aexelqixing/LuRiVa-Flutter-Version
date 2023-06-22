/// Rounds DateTime object to the next multiple of 10 in minutes (like 8:53->9:00, 12:17->12:20, etc)
DateTime roundNearestTen(DateTime datetime) {
  int minutes = datetime.minute;
  int newMinutes = (minutes/10).ceil() * 10;

  return DateTime(datetime.year, datetime.month, datetime.day, datetime.hour, newMinutes);
}