import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Crudely designed with ",
              style: theme.textTheme.bodySmall!.copyWith(
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
              text: "Pen and Paper",
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
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
              text: " :)\nCoded in ",
             style: theme.textTheme.bodySmall!.copyWith(
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
              text: "VSCode",
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
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
              text: " by yours truly\nBuilt with ",
              style: theme.textTheme.bodySmall!.copyWith(
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
              text: "Flutter",
              style: theme.textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w700,
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
    );
  }
}
