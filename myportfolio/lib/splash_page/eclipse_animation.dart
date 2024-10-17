import 'package:flutter/material.dart';

class EclipseAnimation extends StatefulWidget {
  final VoidCallback onFirstAnimationComplete; // Callback for first animation
  final VoidCallback onSecondAnimationComplete; // Callback for second animation
  final double finalSize; // Final size of the eclipse in the second animation

  const EclipseAnimation({
    super.key,
    required this.onFirstAnimationComplete,
    required this.onSecondAnimationComplete,
    required this.finalSize,
  });

  @override
  EclipseAnimationState createState() => EclipseAnimationState();
}

class EclipseAnimationState extends State<EclipseAnimation> with TickerProviderStateMixin {
  late final AnimationController _firstController; // First part of the animation
  late final AnimationController _secondController; // Second part (grow the eclipse)
  late final Animation<double> _firstAnimation;
  late final Animation<double> _secondAnimation;

  @override
  void initState() {
    super.initState();

    // First animation controller (for the initial eclipse reveal)
    _firstController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onFirstAnimationComplete(); // Notify when first animation completes
          _startSecondAnimation(); // Start the second animation
        }
      })..forward();

    _firstAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _firstController, curve: Curves.easeInOut),
    );

    // Second animation controller (for growing the eclipse)
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onSecondAnimationComplete(); // Notify when second animation completes
        }
      });

    _secondAnimation = Tween<double>(begin: 200, end: widget.finalSize).animate(
      CurvedAnimation(parent: _secondController, curve: Curves.easeInExpo),
    );
  }

  @override
  void dispose() {
    _firstController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  // Start second animation when the first completes
  void _startSecondAnimation() {
    _secondController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Second animation: Eclipse grows to cover the screen
        AnimatedBuilder(
          animation: _secondAnimation,
          builder: (context, child) {
            return Container(
              width: _secondAnimation.value,
              height: _secondAnimation.value,
              decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const RadialGradient(
              colors: [Colors.pink, Colors.orange],
              center: Alignment(-0.5, -0.5),
              radius: 0.6,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
            );
          },
        ),

        // First animation: Eclipse reveals itself
        AnimatedBuilder(
          animation: _firstAnimation,
          builder: (context, child) {
            return ClipRect(
              child: Align(
                alignment: Alignment.centerLeft,
                widthFactor: _firstAnimation.value,
                child: Container(
                  width: 200,
                  height: 300,
                  color: const Color(0xff141218),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
