import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/experience_section/experience_item.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExperienceItem> experiences = [
      const ExperienceItem(
        startDate: '04/2024',
        endDate: 'Present',
        title: 'Junior DevOps Engineer',
        description: '''
• Leading DevOps efforts for a government project, focusing on infrastructure automation and orchestration.
• Using Ansible and Terraform to streamline provisioning and configuration across various environments.
• Automating tasks with Linux scripting and Python, enhancing operational efficiency.
''',
        techList: [
          'Ansible', 'Terraform', 'Linux', 'Python', 'Git', 'Docker', 'Pipelines'
        ],
      ),
      const ExperienceItem(
        startDate: '10/2023',
        endDate: '04/2024',
        title: 'Cloud Integrations Developer (MuleSoft)',
        description: '''
• Developed and maintained MuleSoft integrations for an ad campaign automation project, interfacing with Google Ads, Facebook, and GDV360.
• Implemented APIs and microservices to enable efficient data exchange between marketing platforms and internal systems.
''',
        techList: ['MuleSoft', 'Dataweave', 'JSON', 'XML', 'MUnit Tests', 'Google Ads API', 'Facebook API', 'GDV360'],
      ),
      const ExperienceItem(
        startDate: '12/2022',
        endDate: '10/2023',
        title: 'Junior Cloud Integrations Developer (MuleSoft)',
        description: '''
• Contributed to the design and deployment of MuleSoft solutions for ad campaign automation.
''',
        techList: ['MuleSoft', 'Dataweave', 'JSON', 'XML', 'MUnit Tests'],
      ),
      const ExperienceItem(
        startDate: '04/2022',
        endDate: '12/2022',
        title: 'Cloud Integrations (MuleSoft)',
        description: '''
• Assisted in a large-scale data migration project, gaining hands-on experience with MuleSoft integration tools.
''',
        techList: ['MuleSoft', 'Dataweave', 'JSON', 'XML'],
      ),
    ];

    return Column(
      children: experiences
          .map((experience) => Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: experience,
              ))
          .toList(),
    );
  }
}
