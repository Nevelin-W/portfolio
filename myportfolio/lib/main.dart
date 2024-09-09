import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/splash_page/splash_page.dart';

final theme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor:  Colors.orange,
    brightness: Brightness.dark,
    surface: const Color.fromARGB(255, 42, 51, 59),
    primary: const Color.fromRGBO(255, 24, 24, 1),
  ),
  textTheme: GoogleFonts.sourceCodeProTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
    
  ),
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
      home: const SplashPage(),
    );
  }
}

