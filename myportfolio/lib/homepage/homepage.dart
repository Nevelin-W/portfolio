import 'package:flutter/material.dart';
import 'package:myportfolio/homepage/buttons/resume_button.dart';
import 'package:myportfolio/homepage/buttons/menu_button_style.dart';
//import 'package:myportfolio/homepage/buttons/menu-button.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context);
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
                  Color.fromARGB(255, 46, 152, 160),
                  Color.fromARGB(255, 0, 0, 0)
                ], // Gradient background
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          actions: <Widget>[
            //Menubutton(),
            TextButton(
              onPressed: () {},
              child: Text("Home"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("About"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Works"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Experience"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Certifications"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              onPressed: () {},
              child: Text("Contact"),
              style: menuButtonStyle,
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Resumebutton(),
            ),
          ],
        ),
        body: Center(
          child: Text(
            "Homepage Content",
            style: theme.textTheme.bodyMedium, // Use theme text style
          ),
        ));
  }
}
