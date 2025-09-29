import 'package:flutter/material.dart';

class AdvancedAnimation extends StatefulWidget {
  const AdvancedAnimation({super.key});

  @override
  State<AdvancedAnimation> createState() => _AdvancedAnimationState();
}

class _AdvancedAnimationState extends State<AdvancedAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Advanced Animation'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RotationTransition(
              turns:
                  CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
              child: TweenAnimationBuilder(
                  onEnd: () {},
                  tween: DecorationTween(
                    begin: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(color: Colors.black, width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.circular(0)),
                    end: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.red, width: 2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.red.withOpacity(0.5),
                              blurRadius: 10,
                              spreadRadius: 5,
                              offset: Offset(0, 5))
                        ],
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  duration: Duration(seconds: 6),
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          spacing: 20,
                          children: [
                            Container(
                              height: 100,
                              width: 50,
                              decoration: value,
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            )
          ],
        ));
  }
}
