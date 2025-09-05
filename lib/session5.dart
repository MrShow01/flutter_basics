import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Session5 extends StatelessWidget {
  const Session5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            dragStartBehavior: DragStartBehavior.start,
            onVerticalDragStart: (details) =>
                log("Vertical Drag Start: ${details.globalPosition}"),
            onVerticalDragEnd: (details) =>
                log("Vertical Drag End: ${details.velocity}"),
            onHorizontalDragStart: (details) =>
                log("Horizontal Drag Start: ${details.globalPosition}"),
            onHorizontalDragEnd: (details) =>
                log("Horizontal Drag End: ${details.velocity}"),
            child: Draggable(
              onDragStarted: () => log("Drag Started"),
              // onDragUpdate: (details) {
              //   log("Drag Update: ${details.globalPosition}");
              //   if (Offset(80, 160) > details.globalPosition &&
              //       details.globalPosition >= Offset(40, 120)) {
              //     log('you have reached the target position');
              //   }
              // },
              onDragEnd: (details) => log("Drag End: ${details.velocity}"),
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 150),
            child: Transform(
              transform: Matrix4.rotationZ(0),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Image.asset(
            'assets/icon.png',
          ),
        ],
      ),
    );
  }
}
