import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class JokeColumn extends StatefulWidget {
  const JokeColumn({super.key});

  @override
  State<JokeColumn> createState() => _JokeColumnState();
}

class _JokeColumnState extends State<JokeColumn> {
  bool _showSecondAnimation = false;
  bool _showThirdAnimation = false;
  bool _showForthAnimation = false;
  @override
  Widget build(BuildContext context) {
    return Column(
     
      children: [
        Stack(
          children: [
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20), 
              child: Container(
                width: 400,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  _buildDot(Colors.red),
                  const SizedBox(width: 5),
                  _buildDot(Colors.yellow),
                  const SizedBox(width: 5),
                  _buildDot(Colors.green),
                ],
              ),
            ),
            Positioned(
              top: 30,
              left: 15,
              child: Row(
                children: [
                  const Text(
                    '\$',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'find / -name "life.dart"',
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        speed: const Duration(milliseconds: 60),
                      ),
                    ],
                    totalRepeatCount: 1,
                    onFinished: () {
                      setState(() {
                        _showSecondAnimation = true;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_showSecondAnimation)
              Positioned(
                top: 70,
                left: 15,
                child: Row(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '> Searching...',
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      totalRepeatCount: 1,
                      onFinished: () {
                      setState(() {
                        _showThirdAnimation = true;
                      });
                    },
                    ),
                  ],
                ),
              ),
              if (_showThirdAnimation)
              Positioned(
                top: 100,
                left: 15,
                child: Row(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '> Error: No life found!',
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      totalRepeatCount: 1,
                      onFinished: () {
                      setState(() {
                        _showForthAnimation = true;
                      });
                    },
                    ),
                  ],
                ),
              ),
              if (_showForthAnimation)
              Positioned(
                top: 130,
                left: 15,
                child: Row(
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '> Since you are a programmer, you have no life!',
                          textStyle: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                          speed: const Duration(milliseconds: 60),
                        ),
                      ],
                      totalRepeatCount: 1,
                      onFinished: () {
                      setState(() {
                        _showForthAnimation = true;
                      });
                    },
                    ),
                  ],
                ),
              ),
          ],
        ),
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
}