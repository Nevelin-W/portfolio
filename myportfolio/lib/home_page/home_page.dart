import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/buttons/resume_button.dart';
import 'package:myportfolio/home_page/buttons/animated_menu_button.dart';
import 'package:myportfolio/home_page/content/home_page_content.dart';
import 'package:myportfolio/cerificates_page/cerificates_page.dart';
import 'package:myportfolio/contact_me_page/contact_me_page.dart';
import 'package:myportfolio/my_work_page/my_work_page.dart';
import 'package:myportfolio/my_experience_page/my_experience_page.dart';
//import 'package:myportfolio/home_page/buttons/menu_button.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index); // Jump to the corresponding page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleTextStyle: const TextStyle(
          fontFamily: 'Roboto', // Custom font
          fontWeight: FontWeight.w800,
          fontSize: 40,
          color: Colors.black,
          letterSpacing: 1.5,
        ),
        centerTitle: false,
        title: const Text(
          "RKS",
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 255, 255, 255)
              ], // Gradient background
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        //leading: Menubutton(), TO BE EXPLORED
        actions: <Widget>[
          AnimatedTextButton(
            text: "Home",
            onPressed: () => _onItemTapped(0),
          ),
          const SizedBox(width: 10),
          AnimatedTextButton(
            text: "My Work",
            onPressed: () => _onItemTapped(1),
          ),
          const SizedBox(width: 10),
          AnimatedTextButton(
            text: "My Experience",
            onPressed: () => _onItemTapped(2),
          ),
          const SizedBox(width: 10),
          AnimatedTextButton(
            text: "Certificates",
            onPressed: () => _onItemTapped(3),
          ),
          const SizedBox(width: 10),
          AnimatedTextButton(
            text: "Contact Me",
            onPressed: () => _onItemTapped(4),
          ),
          const SizedBox(width: 10),
          const Resumebutton(),
          const SizedBox(width: 10),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: const [
          HomePageContent(), // Page 0
          MyWorkPage(), // Page 1
          MyExperiencePage(), // Page 2
          CertificatesPage(), // Page 3
          ContactMePage(), // Page 4
        ],
      ),
    );
  }
}
