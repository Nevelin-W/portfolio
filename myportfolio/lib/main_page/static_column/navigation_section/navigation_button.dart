import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final bool isSelected;

  const NavigationButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: isSelected ? 40 : 15,
          height: 2,
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 5),
        TextButton(
          onPressed: onPressed,
          style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(50),
              overlayColor: WidgetStatePropertyAll(
                Colors.transparent,
              )),
          child: Text(
            buttonText,
            style: theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
