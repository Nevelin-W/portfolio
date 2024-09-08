import 'package:flutter/material.dart';

class ResumeButton extends StatelessWidget {
  const ResumeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle View Full Resume click
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        overlayColor: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'View Full Resume',
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(width: 8), // Spacing between text and icon
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
            size: 15,
          ),
        ],
      ),
    );
  }
}
