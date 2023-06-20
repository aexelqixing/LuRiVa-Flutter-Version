import 'package:flutter/material.dart';
import 'package:luriva_flutter_ver/themes/light_pink_theme.dart';

Color tile_color = const Color(0xfff7cad0);
Color light_shadow = const Color(0xfffff0f3);
Color dark_shadow = const Color(0xfffbb1bd);

class SessionTile extends StatelessWidget {
  final String sessionName;
  final String sessionDescription;
  final int index;

  const SessionTile({
    super.key,
    required this.sessionName,
    required this.sessionDescription,
    required this.index
  });

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
              color: dark_shadow,
              offset: Offset(4,4),
              blurRadius: 15,
              spreadRadius: 1
            ),

            BoxShadow(
              color: Colors.white,
              offset: Offset(-5, -5),
              blurRadius: 15,
              spreadRadius: 1
            )
          ]
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(index.toString(), style: TextStyle(
                fontSize: 30
              ),),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(sessionName, style: TextStyle(
                  fontSize: 20,
                ),),
                Text(sessionDescription),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
