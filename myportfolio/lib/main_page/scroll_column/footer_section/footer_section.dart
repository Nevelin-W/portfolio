import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  // Reusable shadow style for text
  TextStyle _getTextStyle(BuildContext context, {FontWeight? fontWeight}) {
    final theme = Theme.of(context);
    return theme.textTheme.bodySmall!.copyWith(
      fontWeight: fontWeight ?? FontWeight.normal,
      shadows: [
        Shadow(
          blurRadius: 2,
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(2.0, 2.0),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: RichText(
        text: TextSpan(
          children: [
            // First section: Coded in VSCode
            TextSpan(
              text: "Coded in ",
              style: _getTextStyle(context),
            ),
            TextSpan(
              text: "VSCode",
              style: _getTextStyle(context, fontWeight: FontWeight.w700),
            ),
            
            // Second section: Built with Flutter
            TextSpan(
              text: "\nBuilt with ",
              style: _getTextStyle(context),
            ),
            TextSpan(
              text: "Flutter\n",
              style: _getTextStyle(context, fontWeight: FontWeight.w700),
            ),
            
            // Third section: Hosted on AWS
            TextSpan(
              text: "Hosted on ",
              style: _getTextStyle(context),
            ),
            TextSpan(
              text: "AWS\n",
              style: _getTextStyle(context, fontWeight: FontWeight.w700),
            ),
            
            // Fourth section: Provisioned with Terraform/Docker
            TextSpan(
              text: "Provisioned with ",
              style: _getTextStyle(context),
            ),
            TextSpan(
              text: "Terraform/Docker",
              style: _getTextStyle(context, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
