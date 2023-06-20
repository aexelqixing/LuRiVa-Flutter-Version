import 'package:flutter/material.dart';
import 'package:luriva_flutter_ver/components/session_tile.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

class DaysSessions extends StatefulWidget {
  const DaysSessions({Key? key}) : super(key: key);

  @override
  State<DaysSessions> createState() => _DaysSessionsState();
}

class _DaysSessionsState extends State<DaysSessions> {
  List sessions = [
    ["HUM Reading", "Reading on the Enlightenment"],
    ["Exeter Problems", "Pages 62, 63, Problem 5-10"]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mintyrose,
      body: ListView.builder(
        itemCount: sessions.length,
          itemBuilder: (context, index) {
        return SessionTile(sessionName: sessions[index][0], sessionDescription: sessions[index][1], index: index,);
      }),
    );
  }
}
