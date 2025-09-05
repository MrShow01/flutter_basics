import 'dart:developer';

import 'package:flutter/material.dart';

class Session52 extends StatelessWidget {
  const Session52({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              log("Container tapped");
            },
            onLongPress: () {
              log("Container long pressed");
            },
            onLongPressCancel: () => log("Long press cancelled"),
            child: Draggable(
              onDragStarted: () => log("Drag Started"),
              onDragEnd: (details) => log("Drag End: ${details.offset}"),
              onDragUpdate: (details) =>
                  log("Drag Update: ${details.globalPosition}"),
              onDragCompleted: () => log("Drag Completed"),
              onDraggableCanceled: (velocity, offset) =>
                  log("Drag Canceled: Velocity: $velocity, Offset: $offset"),
              feedback: Container(
                height: 100,
                width: 100,
                color: Colors.orangeAccent,
              ),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue,
              ),
            ),
          ),
          Image.asset(
            'assets/icon.png',
            height: 100,
            width: 100,
            scale: 0.5,
          ),
          Transform(
              transform: Matrix4.rotationZ(5),
              child: Text(
                'Transform Example',
                style: TextStyle(fontSize: 24),
              )),
        ],
      ),
    );
  }
}
