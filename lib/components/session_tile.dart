import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

import '../datetime/formatting_datetime.dart';

/// the 'tile' for a single session
class SessionTile extends StatelessWidget {
  /// the meta data of each session
  final String sessionName;
  final String sessionDescription;
  final int index;

  /// the start and end date of each session
  final DateTime startTime;
  final DateTime endTime;

  final Function(BuildContext)? deleteTapped;

  /// the constructor
  const SessionTile({
    super.key,
    required this.sessionName,
    required this.sessionDescription,
    required this.index,
    required this.startTime,
    required this.endTime,
    required this.deleteTapped,
  });

  // build the actual tile
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            // the Delete button
            SlidableAction(
              onPressed: deleteTapped,
              backgroundColor: Colors.red.shade400,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: mintyrose,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                // shadow on the bottom right
                BoxShadow(
                    color: dark_shadow,
                    offset: Offset(4, 4),
                    blurRadius: 15,
                    spreadRadius: 1),

                // shadow on the top left
                BoxShadow(
                    color: light_shadow,
                    offset: Offset(-5, -5),
                    blurRadius: 15,
                    spreadRadius: 1)
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // the number of what session of the day this is
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      index.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  //
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
                        formatStartAndEnd(startTime, endTime),
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 20),
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
      ),
    );
  }
}
