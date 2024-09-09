import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
          //color: Colors.black,
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
    );
  }
}
