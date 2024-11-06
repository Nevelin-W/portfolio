import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/static_column/joke_section/animated_text_widget.dart';

class JokeSection extends StatefulWidget {
  const JokeSection({super.key});

  @override
  State<JokeSection> createState() => _JokeSectionState();
}

class _JokeSectionState extends State<JokeSection> {
  bool _showFirstAnimation = false;
  bool _showSecondAnimation = false;
  bool _showThirdAnimation = false;
  bool _showForthAnimation = false;

  @override
  void initState() {
    super.initState();
    _triggerFirstAnimation();
  }

  // Trigger the first animation with a delay, followed by the subsequent animations
  void _triggerFirstAnimation() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() => _showFirstAnimation = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _buildCard(),
            Positioned(
              top: 10,
              right: 10,
              child: _buildIndicatorDots(),
            ),
            if (_showFirstAnimation) _buildFirstAnimation(),
            if (_showSecondAnimation) _buildSecondAnimation(),
            if (_showThirdAnimation) _buildThirdAnimation(),
            if (_showForthAnimation) _buildForthAnimation(),
          ],
        ),
      ],
    );
  }

  // Main card for the joke section with shadow and styling
  Widget _buildCard() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 450,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }

  // Indicator dots at the top-right corner of the card
  Widget _buildIndicatorDots() {
    return Row(
      children: [
        _buildDot(Colors.red),
        const SizedBox(width: 5),
        _buildDot(Colors.yellow),
        const SizedBox(width: 5),
        _buildDot(Colors.green),
      ],
    );
  }

  // Single dot widget with specified color
  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  // First animation text row, triggers the second animation on completion
  Widget _buildFirstAnimation() {
    return Positioned(
      top: 30,
      left: 15,
      child: Row(
        children: [
          const Text(
            '\$',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          AnimatedTextWidget(
            text: 'find / -name "life.dart"',
            color: Colors.white,
            onFinished: () => setState(() => _showSecondAnimation = true),
          ),
        ],
      ),
    );
  }

  // Second animation, triggers the third animation on completion
  Widget _buildSecondAnimation() {
    return Positioned(
      top: 70,
      left: 15,
      child: AnimatedTextWidget(
        text: '> Searching...',
        color: Colors.grey,
        onFinished: () => setState(() => _showThirdAnimation = true),
      ),
    );
  }

  // Third animation, triggers the fourth animation on completion
  Widget _buildThirdAnimation() {
    return Positioned(
      top: 100,
      left: 15,
      child: AnimatedTextWidget(
        text: '> Error: No life found!',
        color: const Color.fromRGBO(255, 24, 24, 1),
        onFinished: () => setState(() => _showForthAnimation = true),
      ),
    );
  }

  // Fourth and final animation, signaling the end of the joke sequence
  Widget _buildForthAnimation() {
    return Positioned(
      top: 130,
      left: 15,
      child: AnimatedTextWidget(
        text: '> Since you are a programmer, you have no life!',
        color: Colors.orangeAccent,
        onFinished: () {}, // No further animations
      ),
    );
  }
}
