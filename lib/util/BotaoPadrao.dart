import 'package:flutter/material.dart';

class BotaoPadrao extends StatelessWidget {
  final String value;
  final Function() onTap;
  final Color background;
  const BotaoPadrao({Key key, this.value, this.onTap, this.background})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 50,
      child: RaisedButton(
        color: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: BorderSide(color:  Colors.blue)
            
          
        ),
        onPressed: onTap,
        child: Text(
          "$value".toUpperCase(),
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        textColor: Colors.blue,
      ),
    );
  }
}
