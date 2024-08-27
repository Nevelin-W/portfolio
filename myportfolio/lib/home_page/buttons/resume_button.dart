import 'package:flutter/material.dart';
import 'resume_button_style.dart';

class Resumebutton extends StatelessWidget {
const Resumebutton({ super.key });

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
                style: resumeButtonStyle,
                onPressed: () {},
                child: const Text(
                  "RESUME",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              );
  }
}