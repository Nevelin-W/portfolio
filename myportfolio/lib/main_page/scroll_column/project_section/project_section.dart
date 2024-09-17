import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/project_section/project_item.dart';


class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ProjectItem(
          icon: Icons.web, 
          title: 'Portfolio Website',
          description: '''
• Developed a personal website using Flutter for web.
• Implemented a responsive design with custom animations and transitions.
• Integrated a contact form and portfolio sections.
''',
          techList: ['Flutter', 'Dart', 'AWS, Terraform', 'Docker', 'GitHub CI/CD'],
          url: 'https://github.com/Nevelin-W/portfolio', // Replace with actual URL
        ),
        SizedBox(height: 10),
        ProjectItem(
          icon: Icons.shopping_cart, 
          title: 'Shopping List App',
          description: '''
• Developed a shopping list application using Dart and Flutter.
• Utilized Firebase for storing and managing shopping list items in real-time.
''',
          techList: ['Flutter', 'Dart', 'Firebase'],
          url: 'https://github.com/Nevelin-W/shopping_list_app', // Replace with actual URL
        ),
        SizedBox(height: 10),
        ProjectItem(
          icon: Icons.search, 
          title: 'GIF Search App',
          description: '''
• Developed a mobile application for searching and sharing GIFs, utilizing the Giphy API.
• Leveraged Flutter for the frontend and integrated Riverpod for state management.
• Implemented features including keyword-based search, GIF preview, and sharing functionality.
''',
          techList: ['Flutter', 'Dart', 'Giphy API', 'Riverpod'],
          url: 'https://github.com/Nevelin-W/gif_search_app', // Replace with actual URL
        ),
      ],
    );
  }
}
