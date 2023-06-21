import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luriva_flutter_ver/components/session_tile.dart';
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
  List sessions = [
    [
      "HUM Reading",
      "Reading on the Enlightenment",
      DateTime.now().add(Duration(minutes: 5)),
      DateTime.now().add(Duration(minutes: 10))
    ],
    [
      "Exeter Problems",
      "Pages 62, 63, Problem 5-10",
      DateTime.now().add(Duration(minutes: 15)),
      DateTime.now().add(Duration(minutes: 25))
    ],
  ];

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
      sessions.removeAt(index);
    });
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
                itemCount: sessions.length,
                itemBuilder: (context, index) {
                  return SessionTile(
                    sessionName: sessions[index][0],
                    sessionDescription: sessions[index][1],
                    index: index,
                    startTime: sessions[index][2],
                    endTime: sessions[index][3],
                    deleteTapped: (context) => deleteSession(index),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {},
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
