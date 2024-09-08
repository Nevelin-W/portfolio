import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/main_page/static_column/navigation_buttons.dart';
import 'package:myportfolio/main_page/static_column/buttons/icon_link_button.dart';
import 'package:myportfolio/home_page/content/joke_column.dart';

class StaticColumn extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final double indicatorPosition;

  const StaticColumn({
    super.key,
    required this.onAboutPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.indicatorPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.blueGrey[900],
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 100),
            // Title Text at the top
            const Text(
              'Roberts Kārlis Šmits',
              style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'DevOps Engineer',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              "I streamline and automate infrastructure, ensuring reliable, scalable, and efficient delivery of software.",
              style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
            ),
            const SizedBox(height: 60),
            // Navigation links with animated indicator
            NavigationButtons(
              onAboutPressed: onAboutPressed,
              onExperiencePressed: onExperiencePressed,
              onProjectsPressed: onProjectsPressed,
              indicatorPosition: indicatorPosition,
            ),
            const Spacer(),
            Center(child: JokeColumn()),
            const Spacer(),
            // LinkedIn and GitHub Icons at the bottom
            const Row(
              children: [
                IconLinkButton(
                  icon: FontAwesomeIcons.linkedin,
                  url: 'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/',
                ),
                IconLinkButton(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/Nevelin-W',
                ),
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
