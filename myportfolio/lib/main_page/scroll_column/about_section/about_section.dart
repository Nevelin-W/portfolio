import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  AboutSectionState createState() => AboutSectionState();
}

class AboutSectionState extends State<AboutSection> {
  bool _isHovered = false; // Tracks hover status

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true; // Hovered state set to true
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false; // Hovered state set to false
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent,
          borderRadius: BorderRadius.circular(6), // Rounded corners
        ),
        child: buildRichText(theme),
      ),
    );
  }

  /// Helper method to construct the [Text.rich] widget.
  Widget buildRichText(ThemeData theme) {
    return Text.rich(
      TextSpan(
        children: [
          buildText(theme, "A little about myself\n\n", FontWeight.bold),
          buildText(
            theme,
            "In 2021, I began studying Information Technologies at RTU, but after just one semester, I realized that academia wasn’t for me at that time, "
            "and I quickly transitioned into the tech industry, starting as a Cloud Integrations Intern specializing in MuleSoft. "
            "I advanced from intern to developer in a relatively small amount of time. "
            "While I found the experience I gained to be valuable, I was concerned about the limitations of MuleSoft's low-code environment and the long-term prospects for my career, "
            "which prompted my shift in specialization/technologies.\n\n",
            FontWeight.w400,
          ),
          buildText(theme, "Enter DevOps\n\n", FontWeight.bold),
          buildText(
            theme,
            "As a Junior DevOps Engineer, I lead infrastructure automation with Ansible, Terraform, Linux scripting, and Python keeping everything from deployments to debugging in check. "
            "I thrive on problem-solving, whether it’s tackling complex challenges or those ‘easy-yet-elusive’ issues that keep me on my toes. "
            "Always expanding my skills, I’m here to make sure things run smoothly (and preferably, without any 3 a.m. surprises).\n\n",
            FontWeight.w400,
          ),
          buildText(theme, "Outside of work\n\n", FontWeight.bold),
          buildText(
            theme,
            "Recently, I re-enrolled in Information Technologies to deepen my knowledge, fueled by a newfound passion for learning. "
            "When I’m not at work or hitting the books, you can find me kitesurfing, playing squash, or diving into Flutter and Dart development for native mobile apps and webpages—like the one you’re browsing right now!",
            FontWeight.w400,
          ),
        ],
      ),
    );
  }

  /// Creates a [TextSpan] with shadow effects and customizable font weight.
  TextSpan buildText(ThemeData theme, String text, FontWeight fontWeight) {
    return TextSpan(
      text: text,
      style: theme.textTheme.bodyMedium?.copyWith(
        fontWeight: fontWeight,
        shadows: [
          Shadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
    );
  }
}
