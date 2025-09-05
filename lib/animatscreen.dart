import 'package:flutter/material.dart';

class Animatscreen extends StatefulWidget {
  const Animatscreen({super.key});

  @override
  State<Animatscreen> createState() => _AnimatscreenState();
}

class _AnimatscreenState extends State<Animatscreen> {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.green;
  double _radius = 0;
  double _opacity = 1;
  bool _showFirst = true;
  AlignmentGeometry _alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              _width = _width == 200 ? 100 : 200;
              _height = _height == 200 ? 100 : 200;
              _color = _color == Colors.red ? Colors.green : Colors.red;
              _radius = _radius == 0 ? 100 : 0;
              _alignment = _alignment == Alignment.center
                  ? Alignment.topRight
                  : Alignment.center;
            }),
            child: AnimatedAlign(
              duration: Duration(milliseconds: 5000),
              alignment: _alignment,
              curve: Curves.easeInOutSine,
              child: AnimatedContainer(
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                    color: _color,
                    borderRadius: BorderRadius.circular(_radius)),
                duration: Duration(milliseconds: 500),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () => setState(() {
              _showFirst = !_showFirst;
              _opacity = _opacity == 0 ? 1 : 0;
            }),
            child: AnimatedCrossFade(
                firstChild: Container(
                  height: 50,
                  width: 200,
                  color: Colors.grey,
                  child: Center(
                    child: Text(
                      'Reveal Me',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                secondChild: Container(
                  height: 50,
                  width: 200,
                  color: Colors.black,
                  child: Center(
                    child: Text(
                      'Secret Revealed',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                reverseDuration: Duration(seconds: 1),
                duration: Duration(milliseconds: 1000)),
          ),
          SizedBox(height: 50),
          AnimatedOpacity(
            opacity: _opacity,
            curve: Curves.easeInQuart,
            duration: Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    ));
  }
}
