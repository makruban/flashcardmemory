import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final double mediaHeight;
  final String title;
  final Function()? onPress;
  final Color color;

  ActionButton(
      {required this.mediaHeight, required this.onPress, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaHeight * 0.08,
      padding: const EdgeInsets.only(left: 60.0, right: 60.0, top: 0.0),
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          elevation: MaterialStateProperty.all(4.0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
        ),
      ),
    );
  }
}