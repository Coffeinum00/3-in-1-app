import 'package:calc_to_do_app/screens/first.dart';
import 'package:calc_to_do_app/screens/to_do.dart';
import 'package:flutter/material.dart';

import 'calc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List screens = [
      First(),
      Calc(),
      ToDoApp(),
    ];
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() => currentIndex = 0);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Calculator'),
              onTap: () {
                setState(() => currentIndex = 1);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('To do list'),
              onTap: () {
                setState(() => currentIndex = 2);
                Navigator.of(context).pop();
              },
            )
          ],
        )),
        appBar: AppBar(
          backgroundColor: Colors.white24,
          title: const Text('My new app'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          backgroundColor: Colors.blue[200],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Calc',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check),
              label: 'To do list',
            ),
          ],
        ),
      ),
    );
  }
}
