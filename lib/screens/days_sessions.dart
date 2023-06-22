import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:luriva_flutter_ver/components/session_tile.dart';
import 'package:luriva_flutter_ver/data/session_database.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

import '../datetime/formatting_datetime.dart';

/// The Screen that shows the sessions for that particular day
class DaysSessions extends StatefulWidget {
  final DateTime day;

  const DaysSessions({
    super.key,
    required this.day,
  });

  @override
  State<DaysSessions> createState() => _DaysSessionsState();
}

class _DaysSessionsState extends State<DaysSessions> {
  SessionDatabase sd = SessionDatabase();
  final _generalDatabase = Hive.box("General_Database");

  @override
  void initState() {
    if (_generalDatabase.get("VERSION") == null) {
      sd.createDefaultData();
    }
    else {
      sd.loadData();
    }

    sd.updateDatabase();
    super.initState();
  }

  /// Returns the title for the screen displayed at the top
  ///
  /// If the day is the current day, displayed "Today" rather than the date
  String formatDayTitle() {
    DateTime now = DateTime.now();
    if (widget.day.year == now.year &&
        widget.day.month == now.month &&
        widget.day.day == now.day) {
      return "${formatWeekday(widget.day.weekday)}, Today";
    } else {
      return "${formatWeekday(widget.day.weekday)}, ${DateFormat('yyyy-MM-dd').format(widget.day)}";
    }
  }

  /// Delete Session
  void deleteSession(int index) {
    setState(() {
      sd.sessions.removeAt(index);
    });
  }

  /// Update All Sessions
  void saveSessions() {
    sd.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mintyrose,
      appBar: AppBar(
        title: Text(formatDayTitle(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
        backgroundColor: amaranth,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: sd.sessions.length,
                itemBuilder: (context, index) {
                  return SessionTile(
                    sessionName: sd.sessions[index][0],
                    sessionDescription: sd.sessions[index][1],
                    index: index,
                    startTime: sd.sessions[index][2],
                    endTime: sd.sessions[index][3],
                    deleteTapped: (context) => deleteSession(index), isBlockout: sd.sessions[index][4],
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: saveSessions,
                style: ElevatedButton.styleFrom(
                    backgroundColor: amaranth,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Save Sessions", style: TextStyle(fontSize: 25),),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
