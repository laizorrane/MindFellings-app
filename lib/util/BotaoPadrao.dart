import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  final String value;
  final Function() onTap;
  final Color background; 
  const BotaoPadrao({Key key, this.value, this.onTap, this.background}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: RaisedButton(
        color: background,
        shape: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
          const Radius.circular(5.0),
        )),
        onPressed: onTap,
        child: Text("$value"),
      ),
    );
  }
}
