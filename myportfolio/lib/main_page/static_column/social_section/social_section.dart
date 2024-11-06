// social_section.dart

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/main_page/static_column/buttons/icon_link_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialSection extends StatefulWidget {
  final ThemeData theme;

  const SocialSection({
    super.key,
    required this.theme,
  });

  @override
  SocialSectionState createState() => SocialSectionState();
}

class SocialSectionState extends State<SocialSection> {
  // Function to handle email button press
  Future<void> _handleEmailButtonPress() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'roberts365653@gmail.com',
      query: 'subject=Let\'s Chat&body=Hello, Roberts Kārlis Šmits!',
    );

    if (await canLaunchUrl(params)) {
      await launchUrl(params);
    } else if (mounted) {
      // Only show SnackBar if widget is still mounted
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not launch email client.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          // LinkedIn and GitHub icons for social links
          const IconLinkButton(
            icon: FontAwesomeIcons.linkedin,
            buttonColor: Color(0xFF0072B1),
            url: 'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/',
          ),
          const IconLinkButton(
            icon: FontAwesomeIcons.github,
            buttonColor: Color(0xFF6e5494),
            url: 'https://github.com/Nevelin-W',
          ),
          const Spacer(),
          const SizedBox(width: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: _handleEmailButtonPress,
              icon: Icon(
                FontAwesomeIcons.solidEnvelope,
                color: widget.theme.colorScheme.primary,
              ),
              label: Text(
                "Let's Chat",
                style: widget.theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              style: TextButton.styleFrom(
                iconColor: widget.theme.colorScheme.onSurface,
                overlayColor: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
