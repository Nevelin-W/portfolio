import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile title
        Text(
          'Roberts Kārlis Šmits',
          style: theme.textTheme.displaySmall!.copyWith(
            fontSize: 41,
            fontWeight: FontWeight.w700,
            wordSpacing: 9,
            shadows: [Shadow(blurRadius: 2, color: Colors.black.withOpacity(0.3), offset: const Offset(2.0, 2.0))],
          ),
        ),
        const SizedBox(height: 10),
        // Role description
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: 'DevOps', style: theme.textTheme.headlineSmall),
              TextSpan(text: ' \u{2022} ', style: TextStyle(color: theme.colorScheme.primary)),
              TextSpan(text: 'Engineer', style: theme.textTheme.headlineSmall),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Short bio text
        Text(
          "I streamline and automate infrastructure, ensuring reliable, scalable, and efficient delivery of software.",
          style: theme.textTheme.bodyMedium!.copyWith(color: theme.colorScheme.inverseSurface, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}