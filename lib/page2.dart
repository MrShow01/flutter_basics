import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_basics/page1.dart';
import 'package:flutter_basics/page4.dart';

import 'page3.dart';

class Page2 extends StatefulWidget {
  static const String routeName = '/page2';
  Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int currentIndex = 0;

  List<Widget> screens = [
    Page1(
      title: 'Page 1',
    ),
    Page3(),
    Page4(),
  ];
  Stream<int> countStream() async* {
    for (int i = 1; i <= 50000; i++) {
      await Future.delayed(Duration(milliseconds: 200));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Stream<int> stream = countStream();
    // stream.listen((value) {
    //   print('Received: $value');
    // });z
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page1',
            tooltip: 'Go to Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Page2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page3',
          ),
        ],
        onTap: (value) => setState(() {
          log(value.toString());
          currentIndex = value;
        }),
      ),
      body: screens[currentIndex],
    );
  }
}
