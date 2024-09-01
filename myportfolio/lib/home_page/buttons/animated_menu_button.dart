import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/buttons/menu_button_style.dart';

class AnimatedTextButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const AnimatedTextButton({
    required this.text,
    required this.onPressed,
  });

  @override
  AnimatedTextButtonState createState() => AnimatedTextButtonState();
}

class AnimatedTextButtonState extends State<AnimatedTextButton> {
  bool _isHovered = false;

  double _getTextWidth(String text, TextStyle textStyle) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(); // Perform the layout
    return textPainter.size.width; // Get the width
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 1,
      color: Colors.black,
    ); // Use your desired text style
    double underlineWidth = _isHovered ? _getTextWidth(widget.text, textStyle) : 0;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: menuButtonStyle,
        child: Stack(
          children: [
            Text(widget.text, style: textStyle),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: underlineWidth,
              decoration: BoxDecoration(
                gradient: _isHovered ? const LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.lightGreenAccent,
                  ],
                ) : null,
              ),
              margin: const EdgeInsets.only(top: 25),
            ),
          ],
        ),
      ),
    );
  }
}
