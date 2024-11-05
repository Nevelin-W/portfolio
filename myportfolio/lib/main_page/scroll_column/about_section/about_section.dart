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
          color:
              _isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent,
          borderRadius: BorderRadius.circular(6), // Rounded corners
        ),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "A little about myself\n\n",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text:
                    "In 2021, I began studying Information Technologies at RTU, but after just one semester, I realized that academia wasn’t for me at that time, "
                    "and I quickly transitioned into the tech industry, starting as a Cloud Integrations Intern specilizing in MuleSoft, "
                    "I advanced from intern to developer in a relativaly small amount of time. "
                    "While I found the experience I gained to be valuable, I was concerned about the limitations of MuleSoft's low-code environment and the long-term prospects for my career, which prompted my shift in specilization/technologies.\n\n",
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
              TextSpan(
                text: "Enter DevOps\n\n",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text:
                    "As a Junior DevOps Engineer, I lead infrastructure automation with Ansible, Terraform, Linux scripting, and Python keeping everything from deployments to debugging in check. "
                    "I thrive on problem-solving, whether it’s tackling complex challenges or those ‘easy-yet-elusive’ issues that keep me on my toes. "
                    "Always expanding my skills, I’m here to make sure things run smoothly (and preferably, without any 3 a.m. surprises).\n\n",
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
              TextSpan(
                text: "Outside of work\n\n",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              TextSpan(
                text:
                    "Recently, I re-enrolled in Information Technologies to deepen my knowledge, fueled by a newfound passion for learning. "
                    "When I’m not at work or hitting the books, you can find me kitesurfing, playing squash, or diving into Flutter and Dart development for native mobile apps and webpages—like the one you’re browsing right now!",
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
            ],
          ),
        ),
      ),
    );
  }
}
