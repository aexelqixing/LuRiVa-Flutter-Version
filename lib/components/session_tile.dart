import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

Color tile_color = const Color(0xffdaaeb5);

class SessionTile extends StatelessWidget {
  final String sessionName;
  final String sessionDescription;
  final int index;

  final DateTime startTime;
  final DateTime endTime;

  const SessionTile({
    super.key,
    required this.sessionName,
    required this.sessionDescription,
    required this.index,
    required this.startTime,
    required this.endTime,
  });

  String formatStartAndEnd() {
    return "${DateFormat('kk:mm').format(startTime)} > ${DateFormat('kk:mm').format(endTime)}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: mintyrose,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  color: tile_color,
                  offset: Offset(4, 4),
                  blurRadius: 15,
                  spreadRadius: 1),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, -5),
                  blurRadius: 15,
                  spreadRadius: 1)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sessionName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      formatStartAndEnd(),
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 20),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      sessionDescription,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.settings,
                    size: 40,
                  ),
                  tooltip: 'Edit This Session',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
