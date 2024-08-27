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
      letterSpacing: 1,
      color: Colors.black,
    ); // Use your desired text style
    final underlineWidth = _isHovered ? _getTextWidth(widget.text, textStyle) : 0;

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
              duration: Duration(milliseconds: 200),
              height: 2,
              width: underlineWidth as double,
              color: Colors.black,
              margin: EdgeInsets.only(top: 20),
            ),
          ],
        ),
      ),
    );
  }
}