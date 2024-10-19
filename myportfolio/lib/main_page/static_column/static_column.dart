import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myportfolio/main_page/static_column/navigation_section/navigation_section.dart';
import 'package:myportfolio/main_page/static_column/buttons/icon_link_button.dart';
import 'package:myportfolio/main_page/static_column/joke_section/joke_section.dart';
import 'package:url_launcher/url_launcher.dart';

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
        // Title Text at the top
        //Padding(
          //padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
          Text(
            'Roberts Kārlis Šmits',
            style: theme.textTheme.displaySmall!.copyWith(
              fontSize: 41,
              fontWeight: FontWeight.w700,
              wordSpacing: 9,
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
        //),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'DevOps',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
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
                  text: ' \u{2022} ', // Artistic separator
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontSize: theme.textTheme.headlineSmall!.fontSize,
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
                  text: 'Engineer ',
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
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
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
          child: Text(
            "I streamline and automate infrastructure, ensuring reliable, scalable, and efficient delivery of software.",
            style: theme.textTheme.bodyMedium!.copyWith(
              color: theme.colorScheme.inverseSurface,
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
        ),
        const SizedBox(height: 60),
        // Navigation links with animated indicator
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
        // Contact Me and Social Links in Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0), // Add padding
          
          child: Row(
            children: [
              // LinkedIn and GitHub Icons
              const IconLinkButton(
                icon: FontAwesomeIcons.linkedin,
                buttonColor: Color(0xFF0072B1),
                url:
                    'https://www.linkedin.com/in/roberts-k%C4%81rlis-%C5%A1mits-86134130b/',
              ),
              const IconLinkButton(
                icon: FontAwesomeIcons.github,
                buttonColor: Color(0xFF6e5494),
                url: 'https://github.com/Nevelin-W',
              ),
              const Spacer(), // Pushes the email and chat button to the right
              const SizedBox(width: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: () async {
                    final Uri params = Uri(
                      scheme: 'mailto',
                      path: 'roberts365653@gmail.com',
                      query: 'subject=Let\'s Chat&body=Hello, Roberts Kārlis Šmits!',
                    );

                    // Check if the URL can be launched
                    if (await canLaunchUrl(params)) {
                      await launchUrl(params);
                    } else {
                      // Handle the error here
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Could not launch email client.'),
                        ),
                      );
                    }
                  },
                  icon: Icon(
                    FontAwesomeIcons.solidEnvelope,
                    color: theme.colorScheme.primary,
                  ),
                  label: Text(
                    "Let's Chat",
                    style: theme.textTheme.bodyMedium!.copyWith(
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
                    iconColor: theme.colorScheme.onSurface, // Text color
                    overlayColor: Colors.transparent, // Makes the overlay transparent
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
