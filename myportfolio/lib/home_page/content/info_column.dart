import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoColumn extends StatefulWidget {
  const InfoColumn({super.key});

  @override
  _InfoColumnState createState() => _InfoColumnState();
}

class _InfoColumnState extends State<InfoColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isHovered = false; // State variable to track hover

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start the animation
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
        SizedBox(height: 20),
        _buildAnimatedText(
          "Hi, I'm Roberts Kārlis Šmits!\n - a passionate mobile developer\n - a student at RTU Information & Technologies\n - a lifelong learner",
          bodyTextStyle,
        ),
        //BUTTON WITH TEXT "See My Experience" AND ARROW ICON
        SizedBox(height: 40),
        MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: TextButton(
            style: TextButton.styleFrom(
              overlayColor: Colors.transparent,
              foregroundColor: _isHovered ? Colors.black : Colors.white,
              backgroundColor: _isHovered ? Colors.white : Colors.black,
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 12), // Adjust padding
              shape: ContinuousRectangleBorder(
                side: BorderSide(
                    color: _isHovered ? Colors.black : Colors.white, width: 2),
              ),
              minimumSize:
                  Size(200, 50), // Optional: Set a minimum size for the button
            ),
            onPressed: () {
              // Add your navigation or action here
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "SEE MY WORK",
                  style: bodyTextStyle.copyWith(
                    color: _isHovered
                        ? Colors.black
                        : Colors.white, // Change text color on hover
                  ),
                ),
                SizedBox(width: 12), // Adjust spacing between text and icon
                Icon(
                  Icons.arrow_forward,
                  color: _isHovered
                      ? Colors.black
                      : Colors.white, // Change icon color on hover
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 40),
          child: Row(
            children: [
              _buildLinkButton(
                'GitHub',
                'https://github.com/Nevelin-W',
                bodyTextStyle.copyWith(color: Color.fromARGB(255, 50, 201, 90)),
              ),
              Text(" / ", style: bodyTextStyle),
              _buildLinkButton(
                'LinkedIn',
                'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/',
                bodyTextStyle.copyWith(color: Colors.lightBlueAccent),
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

  Widget _buildLinkButton(String text, String url, TextStyle style) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      onPressed: () => _launchUrl(Uri.parse(url)),
      child: Text(text, style: style),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
