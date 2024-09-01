import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/home_page.dart';
import 'package:myportfolio/splash_page/animated_triangle.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {}); // Simulate a delay for loading
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Homepage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedTriangle(),
      ),
    );
  }
}
