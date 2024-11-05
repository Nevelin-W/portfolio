import 'package:flutter/material.dart';

class EclipseAnimation extends StatefulWidget {
  final VoidCallback onFirstAnimationComplete; // Callback for first animation completion
  final VoidCallback onSecondAnimationComplete; // Callback for second animation completion
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

class EclipseAnimationState extends State<EclipseAnimation>
    with TickerProviderStateMixin {
  // Animation controllers for managing the animations
  late final AnimationController _firstController;
  late final AnimationController _secondController;
  late final Animation<double> _firstAnimation;
  late final Animation<double> _secondAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  /// Initializes the animation controllers and animations.
  void _initializeAnimations() {
    // First animation controller (for the initial eclipse reveal)
    _firstController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onFirstAnimationComplete();
          _startSecondAnimation();
        }
      })..forward();

    // Define the first animation: fading out the eclipse
    _firstAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: _firstController, curve: Curves.easeInOut),
    );

    // Second animation controller (for growing the eclipse)
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 1400),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onSecondAnimationComplete();
        }
      });

    // Define the second animation: growing the eclipse to the final size
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

  /// Starts the second animation when the first animation completes.
  void _startSecondAnimation() {
    _secondController.forward(); // Start the forward animation of the second controller
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center, // Center the animations within the stack
      children: [
        _buildSecondAnimation(), // Widget for the second animation (growing eclipse)
        _buildFirstAnimation(), // Widget for the first animation (eclipse reveal)
      ],
    );
  }

  /// Builds the widget for the second animation (growing eclipse).
  Widget _buildSecondAnimation() {
    return AnimatedBuilder(
      animation: _secondAnimation, // Rebuild this widget when the second animation changes
      builder: (context, child) {
        // Create a container that represents the eclipse
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
    );
  }

  /// Builds the widget for the first animation (eclipse reveal).
  Widget _buildFirstAnimation() {
    return AnimatedBuilder(
      animation: _firstAnimation, // Rebuild this widget when the first animation changes
      builder: (context, child) {
        // Create a rectangle that masks the eclipse reveal
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft, // Align the rectangle to the left
            widthFactor: _firstAnimation.value, // Control width based on the first animation value
            child: Container(
              width: 200, // Fixed width of the mask
              height: 300, // Fixed height of the mask
              color: const Color(0xff141218), // Color of the mask
            ),
          ),
        );
      },
    );
  }
}
