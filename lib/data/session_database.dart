import 'package:hive_flutter/hive_flutter.dart';
import 'package:luriva_flutter_ver/datetime/formatting_datetime.dart';

// reference our boxes
final _generalBox = Hive.box("General_Database");
final _sessionBox = Hive.box("Session_Database");

class SessionDatabase {
  List sessions = [];
  List activities = [];

  // create initial default data
  void createDefaultData() {
    sessions = [
      // session name, session desc, start time, end time, is blockout time
      ["Sleeping", "", "0:00", "5:45", true],
      ["Getting ready", "Brush teeth, put on clothes, check bag, eat breakfast", "5:50", "6:10", true],
      ["Commuting to school", "", "6:15", "7:10", true],
      ["School", "All classes for today", "7:45", "2:45", true],
      ["HUM Reading", "Reading on the Enlightenment", "2:55", "3:00", false],
      ["Exeter Problems", "Pages 62, 63, Problem 5-10", "3:10", "3:45", false]
    ];

    _generalBox.put("VERSION", 1.0);
    _generalBox.put("START_DATE", convertDateTimeToString(DateTime.now()));
    _generalBox.put("DEFAULT_SESSIONS", sessions);
  }

  // load data
  void loadData() {
    if (_sessionBox.get(convertDateTimeToString(DateTime.now())) == null) {
      sessions = _generalBox.get("DEFAULT_SESSIONS");
    } else {
      sessions = _sessionBox.get(convertDateTimeToString(DateTime.now()));
    }
  }

  // update database
  void updateDatabase() {
    // update today's entry
    _sessionBox.put(convertDateTimeToString(DateTime.now()), sessions);
  }
}