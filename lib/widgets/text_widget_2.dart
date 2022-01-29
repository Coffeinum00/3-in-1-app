import 'package:flutter/material.dart';

class MyTextWidget2 extends StatefulWidget {
  String? text;
  Color? color;
  double? size;
  bool? checkbox;

  MyTextWidget2({
    Key? key,
    this.text,
    this.color,
    this.size,
    this.checkbox,
  }) : super(key: key);

  @override
  State<MyTextWidget2> createState() => _MyTextWidget2State();
}

class _MyTextWidget2State extends State<MyTextWidget2> {
  @override
  Widget build(BuildContext context) {
    // checkbox == null ? checkbox = false : checkbox = checkbox;
    return Text(
      widget.text!,
      style: TextStyle(
        decoration: widget.checkbox == false || widget.checkbox == null
            ? null
            : TextDecoration.lineThrough,
        decorationColor: Colors.black,
        decorationThickness: 2.0,
        color: widget.color,
        fontWeight: FontWeight.bold,
        fontSize: widget.size,
      ),
    );
  }
}
