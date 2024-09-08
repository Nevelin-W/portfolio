import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/scroll_column/experience_section/experience_section.dart';
import 'package:myportfolio/main_page/scroll_column/experience_section/buttons/resume_button.dart';
import 'package:myportfolio/main_page/scroll_column/project_section/project_section.dart';
import 'package:myportfolio/main_page/scroll_column/about_section/about_section.dart';

class ScrollColumn extends StatelessWidget {
  final GlobalKey experienceKey;
  final GlobalKey projectsKey;
  final ScrollController scrollController;

  const ScrollColumn({
    super.key,
    required this.experienceKey,
    required this.projectsKey,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        constraints: BoxConstraints.tight(const Size(1100, double.infinity)),
        child: SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              // About Section
              Container(
                child: AboutSection(),
              ),
              SizedBox(height: 100),
              // Experience Section
              Container(
                key: experienceKey,
                child: ExperienceSection(),
              ),
              SizedBox(height: 10),
              ResumeButton(),
              SizedBox(height: 100),
              // Projects Section
              Container(
                key: projectsKey,
                child: ProjectSection(),
              ),
              SizedBox(height: 100),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Crudely designed with ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "Pen and Paper",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        TextSpan(
                          text: " :)\nCoded in ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "VSCode",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        TextSpan(
                          text: " by yours truly\nBuilt with ",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextSpan(
                          text: "Flutter",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
