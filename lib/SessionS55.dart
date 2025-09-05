import 'dart:developer';

import 'package:flutter/material.dart';

class Sessions55 extends StatelessWidget {
  const Sessions55({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Draggable(
            feedback: Container(
              height: 200,
              width: 200,
              color: Color.fromARGB(255, 187, 255, 99),
            ),
            // onDragStarted: () => log("Drag Started"),
            // onDragCompleted: () => log("Drag Completed"),
            // onDragEnd: (details) => log("Drag Ended: ${details.velocity}"),
            // onDraggableCanceled: (velocity, offset) =>
            //     log("Drag Cancelled: Velocity: $velocity, Offset: $offset"),
            // onDragUpdate: (details) {
            //   log("Drag Updated: ${details.globalPosition}");
            //   if (Offset(80, 160) > details.globalPosition &&
            //       details.globalPosition >= Offset(40, 120)) {
            //     log('You have reached the target position');
            //   }
            // },
            child: GestureDetector(
              onTap: () => log("Container Tapped"),
              onLongPress: () => log("Container Long Pressed"),
              onLongPressCancel: () => log("Long Press Cancelled"),
              onLongPressStart: (details) =>
                  log("Long Press Started: ${details.globalPosition}"),
              onDoubleTap: () => log("Container Double Tapped"),
              child: Container(
                height: 200,
                width: 200,
                color: Color(0xff63B4FF),
              ),
            ),
          ),
          SizedBox(height: 20),
          Image.asset(
            'assets/icon.png',
            scale: 0.5,
          ),
          Transform(
            transform: Matrix4.rotationZ(0.6), // Rotate the container
            origin: Offset(-1, 1),

            child: Container(
              height: 100,
              width: 200,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
