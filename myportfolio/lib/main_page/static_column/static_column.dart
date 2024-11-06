import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/static_column/navigation_section/navigation_section.dart';
import 'package:myportfolio/main_page/static_column/joke_section/joke_section.dart';
import 'package:myportfolio/main_page/static_column/header_section/header_section.dart';
import 'package:myportfolio/main_page/static_column/social_section/social_section.dart';

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
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(height: 100),

        const HeaderSection(),

        NavigationSection(
          onAboutPressed: onAboutPressed,
          onExperiencePressed: onExperiencePressed,
          onProjectsPressed: onProjectsPressed,
          indicatorPosition: indicatorPosition,
        ),
        const SizedBox(height: 20), // Added spacing instead of Spacer
        const Center(
          child: JokeSection(),
        ),
        const SizedBox(height: 20), // Added spacing instead of Spacer
        SocialSection(theme: theme,)
        
      ],
    );
  }
}
