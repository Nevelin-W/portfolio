import 'package:flutter/material.dart';

class EclipseAnimation extends StatefulWidget {
  final VoidCallback onAnimationComplete; // Add this line

  const EclipseAnimation({super.key, required this.onAnimationComplete}); // Modify the constructor

  @override
  EclipseAnimationState createState() => EclipseAnimationState();
}

class EclipseAnimationState extends State<EclipseAnimation> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onAnimationComplete(); // Notify when animation completes
        }
      })..forward();

    _animation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
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
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.pink, Colors.orange],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: _animation.value,
                child: Container(
                  width: 200,
                  height: 200,
                  color: const Color(0xff141218),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
