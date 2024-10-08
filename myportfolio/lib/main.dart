import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/splash_page/splash_page.dart';

final theme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 255, 255, 255),
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 42, 51, 59),
  ),
  textTheme: GoogleFonts.sourceCodeProTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home:  SplashPage(),
    );
  }
}

