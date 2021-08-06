import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  final Function() clique;
  const MenuItem({Key key, this.icon, this.title, String value, this.clique, MaterialColor color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: clique,
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            FaIcon(icon, color: Colors.white, size: 28),
            SizedBox(width: 20),
            Text(title, style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24,
              color: Colors.white
            ),)

          ],
        ),
      ),
      
    );
  }
}
