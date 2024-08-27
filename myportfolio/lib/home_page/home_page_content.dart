import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      child:  Padding(
        padding: const EdgeInsets.all(200),
        child: Row(
          children: [
            Expanded(
              child: _buildInfoColumn(),
            ),
            const Expanded(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      children: [],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Column(
                children: [Text("test")],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildInfoColumn() {
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
        onPressed: () => _launchUrl(Uri.parse('https://github.com/your-github-profile')),
        child: const Text('GitHub'),
      ),
              const Text(" / "),
              TextButton(
        onPressed: () => _launchUrl(Uri.parse('https://www.linkedin.com/in/your-linkedin-profile')),
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

