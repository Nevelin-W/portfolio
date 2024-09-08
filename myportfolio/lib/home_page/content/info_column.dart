import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/buttons/link_button.dart';

class InfoColumn extends StatefulWidget {
  final VoidCallback onSeeMyWorkPressed;

  const InfoColumn({super.key, required this.onSeeMyWorkPressed});

  @override
  InfoColumnState createState() => InfoColumnState();
}

class InfoColumnState extends State<InfoColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle headerTextStyle = Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(fontSize: 50, fontWeight: FontWeight.bold);

    final TextStyle bodyTextStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAnimatedText(
          "DevOps Engineer\n& Flutter Enthusiast",
          headerTextStyle,
        ),
        const SizedBox(height: 20),
        _buildAnimatedText(
          "Hi, I'm Roberts Kārlis Šmits!\n - a passionate mobile developer\n - a student at RTU Information Technologies\n - a lifelong learner",
          bodyTextStyle,
        ),
        const SizedBox(height: 40),
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
              foregroundColor: _isHovered ? Colors.black : Colors.white,
              backgroundColor: _isHovered ? Colors.white : Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              shape: ContinuousRectangleBorder(
                side: BorderSide(
                    color: _isHovered ? Colors.black : Colors.white, width: 2),
              ),
              minimumSize: const Size(200, 50),
            ),
            onPressed: widget.onSeeMyWorkPressed, // Call the scroll function
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SEE MY WORK",
                  style: bodyTextStyle.copyWith(
                    color:
                        _isHovered ? Colors.black : Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Icon(
                  Icons.arrow_forward,
                  color: _isHovered ? Colors.black : Colors.white,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          child: Row(
            children: [
              LinkButton(
                text: 'GitHub',
                url: 'https://github.com/Nevelin-W',
                style: bodyTextStyle.copyWith(
                    color: const Color.fromARGB(255, 50, 201, 90)),
              ),
              Text(" / ", style: bodyTextStyle),
              LinkButton(
                text: 'LinkedIn',
                url:
                    'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/',
                style: bodyTextStyle.copyWith(color: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedText(String text, TextStyle style) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: _animation.value,
            child: Text(
              text,
              style: style,
            ),
          ),
        );
      },
    );
  }
}
