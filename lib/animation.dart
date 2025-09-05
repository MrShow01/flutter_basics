import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  double _size = 0;
  double _opacity = 1;
  bool _showFirst = true;
  int _itemCount = 3;
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          Center(
            child: GestureDetector(
              onTap: () => setState(() {
                _size = _size == 100 ? 0 : 100;
                _width = _width == 200 ? 100 : 200;
                _height = _height == 200 ? 100 : 200;
                _color = _color == Colors.red ? Colors.green : Colors.red;
              }),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: _color, borderRadius: BorderRadius.circular(_size)),
                width: _width,
                height: _height,
                child: const Center(
                    child: Text(
                  'Change Me',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () => setState(() {
              _showFirst = !_showFirst;
            }),
            child: AnimatedCrossFade(
                firstChild:
                    Container(width: 100, height: 100, color: Colors.red),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    //borderRadius: BorderRadius.circular(50)
                  ),
                ),
                reverseDuration: Duration(seconds: 1),
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 1)),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () => setState(() {
              _opacity = _opacity == 1 ? 0.1 : 1;
            }),
            child: AnimatedOpacity(
              opacity: _opacity,
              duration: Duration(seconds: 1),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  _itemCount = _itemCount + 3;
                });
              },
              child: Text('Add More Items')),
          SizedBox(
            key: Key('animated_gri'),
            height: 1000,
            child: AnimatedGrid(
              scrollDirection: Axis.vertical,
              initialItemCount: _itemCount,
              itemBuilder: (context, index, animation) {
                log(_itemCount.toString());
                return Container(color: Colors.red);
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ),
          )
        ],
      ),
    ));
  }
}
