import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/content/custom_painter.dart';

class AnimatedTriangle extends StatefulWidget {
  const AnimatedTriangle({super.key});

  @override
  State<AnimatedTriangle> createState() => _AnimatedTriangleState();
}

class _AnimatedTriangleState extends State<AnimatedTriangle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCirc,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(270, 270),
          painter: TrianglePainter(_animation.value),
        );
      },
    );
  }
}
