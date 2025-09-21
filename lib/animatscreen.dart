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
  Color _borderColor = Colors.blue;
  double _radius = 0;
  double _opacity = 1;
  double _borderWidth = 1;
  bool _showFirst = true;
  AlignmentGeometry _alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => setState(() {
              _width = _width == 300 ? 200 : 300;
              _height = _height == 100 ? 200 : 100;
              _color = _color == Colors.red ? Colors.deepPurple : Colors.red;
              _radius = _radius == 0 ? 100 : 0;
              _borderColor =
                  _borderColor == Colors.blue ? Colors.red : Colors.blue;
              _borderWidth = _borderWidth == 1 ? 5 : 1;
              _alignment = _alignment == Alignment.center
                  ? Alignment.centerLeft
                  : Alignment.center;
            }),
            child: AnimatedAlign(
              curve: Curves.bounceInOut,
              alignment: _alignment,
              duration: Duration(milliseconds: 2000),
              child: AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.elasticInOut,
                height: _height,
                width: _width,
                decoration: BoxDecoration(
                  color: _color,
                  image: DecorationImage(
                      image: AssetImage('assets/flutter_image.png')),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: _borderColor, width: _borderWidth),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          AnimatedCrossFade(
              firstChild: GestureDetector(
                onTap: () => setState(() {
                  _showFirst = !_showFirst;
                }),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              secondChild: GestureDetector(
                onTap: () => setState(() {
                  _showFirst = !_showFirst;
                }),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/flutter_image.png')),
                  ),
                ),
              ),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(seconds: 2)),
          GestureDetector(
            onTap: () => setState(() {
              _opacity = _opacity == 1 ? 0.1 : 1;
            }),
            child: AnimatedOpacity(
              opacity: _opacity,
              curve: Curves.bounceIn,
              duration: Duration(seconds: 1),
              child: Container(width: 100, height: 100, color: Colors.purple),
            ),
          ),
          // GestureDetector(
          //   onTap: () => setState(() {
          //     _width = _width == 200 ? 100 : 200;
          //     _height = _height == 200 ? 100 : 200;
          //     _color = _color == Colors.red ? Colors.green : Colors.red;
          //     _radius = _radius == 0 ? 100 : 0;
          //     _alignment = _alignment == Alignment.center
          //         ? Alignment.topRight
          //         : Alignment.center;
          //   }),
          //   child: AnimatedAlign(
          //     duration: Duration(milliseconds: 5000),
          //     alignment: _alignment,
          //     curve: Curves.easeInOutSine,
          //     child: AnimatedContainer(
          //       width: _width,
          //       height: _height,
          //       decoration: BoxDecoration(
          //           color: _color,
          //           borderRadius: BorderRadius.circular(_radius)),
          //       duration: Duration(milliseconds: 500),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 50),
          // GestureDetector(
          //   onTap: () => setState(() {
          //     _showFirst = !_showFirst;
          //     _opacity = _opacity == 0 ? 1 : 0;
          //   }),
          //   child: AnimatedCrossFade(
          //       firstChild: Container(
          //         height: 50,
          //         width: 200,
          //         color: Colors.grey,
          //         child: Center(
          //           child: Text(
          //             'Reveal Me',
          //             style: TextStyle(color: Colors.white, fontSize: 20),
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       ),
          //       secondChild: Container(
          //         height: 50,
          //         width: 200,
          //         color: Colors.black,
          //         child: Center(
          //           child: Text(
          //             'Secret Revealed',
          //             style: TextStyle(color: Colors.white, fontSize: 20),
          //             textAlign: TextAlign.center,
          //           ),
          //         ),
          //       ),
          //       crossFadeState: _showFirst
          //           ? CrossFadeState.showFirst
          //           : CrossFadeState.showSecond,
          //       reverseDuration: Duration(seconds: 1),
          //       duration: Duration(milliseconds: 1000)),
          // ),
          // SizedBox(height: 50),
          // AnimatedOpacity(
          //   opacity: _opacity,
          //   curve: Curves.easeInQuart,
          //   duration: Duration(seconds: 1),
          //   child: Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.purple,
          //   ),
          // ),
        ],
      ),
    ));
  }
}
