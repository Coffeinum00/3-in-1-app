import 'dart:math';

import 'package:flutter/material.dart';

class First extends StatefulWidget {
  First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

var height = Random().nextInt(200).toDouble();

var width = Random().nextInt(200).toDouble();

int index = 1;
List<Color> colors = [
  Colors.red[200]!,
  Colors.blue[300]!,
  Colors.green[400]!,
  Colors.yellow[500]!,
  Colors.indigo[600]!,
  Colors.orange[700]!,
  Colors.blueGrey[800]!,
  Colors.green[900]!,
];

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: colors[index],
              height: height,
              width: width,
            ),
          ),
        ),
        SizedBox(
          width: 100.0,
          height: 100.00,
        ),
        ElevatedButton(onPressed: (changecolor), child: Text('Click me'))
      ],
    );
  }

  changecolor() {
    setState(() {
      index = (index + 1);
      if (index == colors.length - 1) {
        index = 0;
      }
      height = Random().nextInt(200).toDouble();
      width = Random().nextInt(200).toDouble();
    });
  }
}
