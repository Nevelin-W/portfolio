import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/experience_section/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExperienceItem(
          yearRange: '04/2024 – Present',
          title: 'DevOps Engineer',
          description: '''
• Leading DevOps initiatives for a high-profile government project, with a focus on infrastructure automation and orchestration.
• Leveraging tools like Ansible and Terraform to streamline provisioning and configuration management across diverse environments.
• Automating repetitive tasks using Linux shell scripting and Python, improving operational efficiency and reducing manual effort.
''',
          techList: ['Ansible', 'Terraform', 'Linux', 'Python'], // List of tech used
        ),
        SizedBox(height: 10),
        ExperienceItem(
          yearRange: '10/2023 – 04/2024',
          title: 'MuleSoft Developer',
          description: '''
• Developed and maintained MuleSoft integration solutions for an advertisement campaign automation project, interfacing with platforms such as Google Ads, Facebook, and GDV360.
• Implemented APIs and microservices to facilitate seamless data exchange between marketing platforms and internal systems.
''',
          techList: ['MuleSoft', 'Google Ads API', 'Facebook API', 'GDV360'], // List of tech used
        ),
        SizedBox(height: 10),
        ExperienceItem(
          yearRange: '12/2022 – 10/2023',
          title: 'Junior MuleSoft Developer',
          description: '''
Contributed to the design, development, and deployment of MuleSoft-based solutions for advertisement campaign automation.
''',
          techList: ['MuleSoft'], // List of tech used
        ),
        SizedBox(height: 10),
        ExperienceItem(
          yearRange: '04/2022 – 12/2022',
          title: 'Intern (MuleSoft)',
          description: '''
Participated in a large-scale data migration project, gaining firsthand experience with MuleSoft integration tools.
''',
          techList: ['MuleSoft'], // List of tech used
        ),
      ],
    );
  }
}
