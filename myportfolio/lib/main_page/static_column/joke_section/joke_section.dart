import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/static_column/joke_section/animated_text_widget.dart'; // Import the new file for animated text widgets

class JokeSection extends StatefulWidget {
  const JokeSection({super.key});

  @override
  State<JokeSection> createState() => _JokeColumnState();
}

class _JokeColumnState extends State<JokeSection> {
  bool _showFirstAnimation = false;
  bool _showSecondAnimation = false;
  bool _showThirdAnimation = false;
  bool _showForthAnimation = false;

  @override
  void initState() {
    super.initState();
    // Trigger the first animation after a 2-second delay
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          _showFirstAnimation = true;
        });
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
            if (_showFirstAnimation)
              Positioned(
                top: 30,
                left: 15,
                child: _buildFirstAnimation(),
              ),
            if (_showSecondAnimation)
              Positioned(
                top: 70,
                left: 15,
                child: _buildSecondAnimation(),
              ),
            if (_showThirdAnimation)
              Positioned(
                top: 100,
                left: 15,
                child: _buildThirdAnimation(),
              ),
            if (_showForthAnimation)
              Positioned(
                top: 130,
                left: 15,
                child: _buildForthAnimation(),
              ),
          ],
        ),
      ],
    );
  }

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
              color: Colors.black.withOpacity(0.2), // Shadow color with opacity
              spreadRadius: 5, // How much the shadow spreads
              blurRadius: 10, // How blurred the shadow is
              offset: const Offset(0, 3), // Shadow position (x, y)
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildFirstAnimation() {
    return Row(
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
          onFinished: () {
            setState(() {
              _showSecondAnimation = true;
            });
          },
        ),
      ],
    );
  }

  Widget _buildSecondAnimation() {
    return AnimatedTextWidget(
      text: '> Searching...',
      color: Colors.grey,
      onFinished: () {
        setState(() {
          _showThirdAnimation = true;
        });
      },
    );
  }

  Widget _buildThirdAnimation() {
    return AnimatedTextWidget(
      text: '> Error: No life found!',
      color: const Color.fromRGBO(255, 24, 24, 1),
      onFinished: () {
        setState(() {
          _showForthAnimation = true;
        });
      },
    );
  }

  Widget _buildForthAnimation() {
    return AnimatedTextWidget(
      text: '> Since you are a programmer, you have no life!',
      color: Colors.orangeAccent,
      onFinished: () {},
    );
  }
}
