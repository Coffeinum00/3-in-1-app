import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  String? text;
  Color? color;
  double? size;

  MyTextWidget({
    Key? key,
    this.text,
    this.color,
    this.size,
  }) : super(key: key);
// MyTextWidget (this.text, this.color);
// MyTextWidget ({required this.text, this.color}); tu text być musi, kolor być może
  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }
}
