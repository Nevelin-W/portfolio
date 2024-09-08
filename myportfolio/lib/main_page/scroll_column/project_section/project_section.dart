import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/project_section/project_item.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectItem(
          icon: Icons.code, // Example icon
          title: 'Personal Website',
          description: '''
• Developed a personal website using Flutter for web.
• Implemented a responsive design with custom animations and transitions.
• Integrated a contact form and portfolio sections.
''',
          techList: ['Flutter', 'Dart', 'Responsive Design'], // List of tech used
        ),
        SizedBox(height: 10),
        ProjectItem(
          icon: Icons.cloud, // Example icon
          title: 'Weather App',
          description: '''
• Created a weather application using Dart and Flutter.
• Integrated a third-party weather API to fetch live data.
• Implemented features like location-based weather and theme-based UI.
''',
          techList: ['Flutter', 'Dart', 'Weather API'], // List of tech used
        ),
        SizedBox(height: 10),
        ProjectItem(
          icon: Icons.shopping_cart, // Example icon
          title: 'E-Commerce App',
          description: '''
• Built a mobile e-commerce application with user authentication and product management.
• Used Flutter for the frontend and Firebase for backend services.
• Implemented a shopping cart, order processing, and user reviews.
''',
          techList: ['Flutter', 'Firebase', 'Dart'], // List of tech used
        ),
      ],
    );
  }
}
