import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  _AboutSectionState createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  bool _isHovered = false; // State variable to track hover status

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true; // Set hover state to true
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false; // Set hover state to false
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent,
          borderRadius: BorderRadius.circular(6), // Rounded corners
        ),
        child: Text(
          "In 2021, I began studying Information Technologies at university, but after one semester, I realized academia wasn’t for me at the time. "
          "I quickly transitioned into the tech industry, starting with MuleSoft, where I advanced from an intern to a developer. "
          "Although valuable, I found the low-code nature of MuleSoft limiting, which prompted my shift to DevOps.\n\n"
          "As a DevOps Engineer, I now lead infrastructure automation using Ansible, Terraform, Linux scripting, and Python. "
          "I enjoy solving complex problems and continuously expanding my skills.\n\n"
          "Recently, I re-enrolled in Information Technologies to deepen my knowledge, driven by a passion for learning. "
          "Outside of work, I balance life through kitesurfing, squash, and exploring Flutter and Dart for mobile and web app development. "
          "I’ve already built a few apps, reflecting my commitment to creating functional and well-designed software.",
          style: theme.textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w400,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(2.0, 2.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
