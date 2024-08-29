import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoColumn extends StatelessWidget {
  const InfoColumn({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle headerTextStyle = TextStyle(
      fontSize: 50,
      fontWeight: FontWeight.bold,
    );

    const TextStyle bodyTextStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "DevOps Engineer",
                style: headerTextStyle,
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: "& Flutter Enthusiast",
                style: headerTextStyle,
              ),
              TextSpan(text: "\n\n"),
              TextSpan(
                text: "Hi, I'm Roberts Kārlis Šmits!",
                style: bodyTextStyle,
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: " - a passionate mobile developer",
                style: bodyTextStyle,
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: " - a student at RTU Information & Technologies",
                style: bodyTextStyle,
              ),
              TextSpan(text: "\n"),
              TextSpan(
                text: " - dedicated problem-solver",
                style: bodyTextStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          child: Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () =>
                    _launchUrl(Uri.parse('https://github.com/Nevelin-W')),
                child: const Text('GitHub'),
              ),
              const Text(" /  "),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.zero,
                ),
                onPressed: () => _launchUrl(Uri.parse(
                    'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/')),
                child: const Text('LinkedIn'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
