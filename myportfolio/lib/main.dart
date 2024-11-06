import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: ThemeMode.dark, // Automatically switches based on the device setting
      home: const SplashPage(),
    );
  }

  ThemeData _lightTheme() {
    return ThemeData.light().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.light,
        surface: const Color.fromARGB(255, 255, 255, 255),
        primary: const Color.fromRGBO(255, 24, 24, 1),
      ),
      textTheme: GoogleFonts.sourceCodeProTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 42, 51, 59),
        primary: const Color.fromRGBO(255, 24, 24, 1),
      ),
      textTheme: GoogleFonts.sourceCodeProTextTheme().apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),
    );
  }
}
