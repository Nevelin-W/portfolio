import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/static_column/buttons/navigation_button.dart';

class NavigationButtons extends StatelessWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onExperiencePressed;
  final VoidCallback onProjectsPressed;
  final double indicatorPosition;

  const NavigationButtons({
    super.key,
    required this.onAboutPressed,
    required this.onExperiencePressed,
    required this.onProjectsPressed,
    required this.indicatorPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NavigationButton(
          buttonText: "About",
          isSelected: indicatorPosition == 0,
          onPressed: onAboutPressed,
        ),
        NavigationButton(
          buttonText: "Experience",
          isSelected: indicatorPosition == 1,
          onPressed: onExperiencePressed,
        ),
        NavigationButton(
          buttonText: "Projects",
          isSelected: indicatorPosition == 2,
          onPressed: onProjectsPressed,
        ),
      ],
    );
  }
}
