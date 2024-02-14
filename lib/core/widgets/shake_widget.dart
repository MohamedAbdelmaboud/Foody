import 'package:flutter/material.dart';

@immutable
class ShakeWidget extends StatelessWidget {
  final Duration duration;
  final double deltaX;
  final Widget? child;
  final Curve curve;
  final bool isShaking;

  const ShakeWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.deltaX = 20,
    this.curve = Curves.bounceOut,
    required this.isShaking,
  }) : super(key: key);

  double shake(double animation) {
    return 2 * (0.5- (0.5 - Curves.bounceOut.transform(animation)).abs());
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      key: key,
      tween: Tween(begin: 0.0, end: isShaking ? 1.0 : 0.0),
      duration: isShaking ? duration : Duration.zero,
      builder: (context, animation, child) => Transform.translate(
        offset: Offset(deltaX * shake(animation), 0),
        child: child,
      ),
      child: child,
    );
  }
}