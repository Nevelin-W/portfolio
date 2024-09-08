import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onFinished;

  const AnimatedTextWidget({
    super.key,
    required this.text,
    this.color = Colors.black,
    required this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(
              text,
              textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: color,
              ),
              speed: const Duration(milliseconds: 60),
            ),
          ],
          totalRepeatCount: 1,
          onFinished: onFinished,
        ),
      ],
    );
  }
}
