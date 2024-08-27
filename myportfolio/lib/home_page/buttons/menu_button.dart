import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/buttons/resume_button_style.dart';

class Menubutton extends StatelessWidget {
  const Menubutton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: resumeButtonStyle,
      icon: const Icon(
        Icons.menu,
      ),
      onPressed: () {
        // Add your onPressed code here!
      },
    );
  }
}
