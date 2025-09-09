import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with TickerProviderStateMixin {
  double _width = 200;
  double _height = 200;
  Color _color = Colors.red;
  double _size = 0;
  double _opacity = 1;
  bool _showFirst = true;
  int _itemCount = 3;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
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
          RotationTransition(
              turns: animation,
              child: Icon(
                Icons.refresh,
                size: 150,
                color: Colors.blue,
              )),
          TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.green, end: Colors.amber),
              curve: Curves.bounceIn,
              duration: Duration(seconds: 5),
              builder: (context, colorValue, child) {
                return TweenAnimationBuilder(
                    tween: Tween<double>(begin: 0, end: 200),
                    curve: Curves.bounceIn,
                    duration: Duration(seconds: 3),
                    builder: (context, value, child) {
                      return Container(
                        width: value,
                        height: value,
                        decoration: BoxDecoration(
                            color: colorValue,
                            borderRadius: BorderRadius.circular(value)),
                      );
                    });
              }),

          // GestureDetector(
          //   onTap: () => setState(() {
          //     _showFirst = !_showFirst;
          //   }),
          //   child: AnimatedCrossFade(
          //       firstChild:
          //           Container(width: 100, height: 100, color: Colors.red),
          //       secondChild: Container(
          //         width: 100,
          //         height: 100,
          //         decoration: BoxDecoration(
          //           color: Colors.blue,
          //           //borderRadius: BorderRadius.circular(50)
          //         ),
          //       ),
          //       reverseDuration: Duration(seconds: 1),
          //       crossFadeState: _showFirst
          //           ? CrossFadeState.showFirst
          //           : CrossFadeState.showSecond,
          //       duration: Duration(seconds: 1)),
          // ),
          // SizedBox(height: 50),
          // GestureDetector(
          //   onTap: () => setState(() {
          //     _opacity = _opacity == 1 ? 0.1 : 1;
          //   }),
          //   child: AnimatedOpacity(
          //     opacity: _opacity,
          //     duration: Duration(seconds: 1),
          //     child: Container(
          //       width: 100,
          //       height: 100,
          //       color: Colors.red,
          //     ),
          //   ),
          // ),
          // SizedBox(height: 50),
          // SizedBox(height: 50),
          // ElevatedButton(
          //     onPressed: () {
          //       setState(() {
          //         _itemCount = _itemCount + 3;
          //       });
          //     },
          //     child: Text('Add More Items')),
          // SizedBox(
          //   key: Key('animated_gri'),
          //   height: 1000,
          //   child: AnimatedGrid(
          //     scrollDirection: Axis.vertical,
          //     initialItemCount: _itemCount,
          //     itemBuilder: (context, index, animation) {
          //       log(_itemCount.toString());
          //       return Container(color: Colors.red);
          //     },
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //         crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
          //   ),
          // ),
          // SizedBox(height: 50),
          // RotationTransition(
          //     turns: animation,
          //     child: Icon(
          //       Icons.refresh,
          //       size: 50,
          //       color: Colors.blue,
          //     )),
          // SizedBox(height: 50),
          // TweenAnimationBuilder(
          //   tween: Tween<double>(begin: 0, end: 100),
          //   duration: Duration(seconds: 3),
          //   builder: (context, value, child) {
          //     return Container(
          //       width: 200,
          //       height: value,
          //       decoration: BoxDecoration(
          //         color: Colors.green,
          //         //  borderRadius: BorderRadius.circular(value),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    ));
  }
}
