import 'package:flutter/widgets.dart';

class Animatedalign extends StatefulWidget {
  const Animatedalign({super.key});

  @override
  State<Animatedalign> createState() => _AnimatedalignState();
}

class _AnimatedalignState extends State<Animatedalign> {
  AlignmentGeometry _alignment = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 53, 51, 51),
      child: GestureDetector(
        onTap: () => setState(() {
          if (_alignment == Alignment.center) {
            _alignment = Alignment.topLeft;
          } else if (_alignment == Alignment.topRight) {
            _alignment = Alignment.bottomLeft;
          } else if (_alignment == Alignment.bottomLeft) {
            _alignment = Alignment.centerRight;
          } else if (_alignment == Alignment.bottomRight) {
            _alignment = Alignment.topRight;
          } else if (_alignment == Alignment.topLeft) {
            _alignment = Alignment.centerLeft;
          } else if (_alignment == Alignment.centerLeft) {
            _alignment = Alignment.bottomRight;
          } else {
            _alignment = Alignment.center;
          }
        }),
        child: AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          child: Container(
            height: 50,
            width: 50,
            color: const Color.fromARGB(255, 255, 0, 0),
          ),
        ),
      ),
    );
  }
}
