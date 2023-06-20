import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luriva_flutter_ver/components/session_tile.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

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

  String formatDayTitle() {
    DateTime now = DateTime.now();
    if (widget.day.year == now.year &&
        widget.day.month == now.month &&
        widget.day.day == now.day) {
      return "Today's Sessions";
    } else {
      return DateFormat('yyyy-MM-dd').format(widget.day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mintyrose,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 0.0),
            child: Text(
              formatDayTitle(),
              style: TextStyle(fontSize: 30),
            ),
          ),
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
                    Text("Save Sessions"),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
