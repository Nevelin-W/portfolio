import 'package:flutter/material.dart';
import 'package:myportfolio/main_page/main_page.dart';
import 'package:myportfolio/splash_page/eclipse_animation.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  late Completer<void> _firstAnimationCompleter;
  late Completer<void> _secondAnimationCompleter;

  @override
  void initState() {
    super.initState();
    _firstAnimationCompleter = Completer<void>();
    _secondAnimationCompleter = Completer<void>();
    _navigateToHome();
  }

  _navigateToHome() async {
    await _firstAnimationCompleter.future; // Wait for the first animation
    await _secondAnimationCompleter.future; // Wait for the second animation
    if (mounted) {
      Navigator.pushReplacement(
        context,
        _createFadeTransitionRoute(),
      );
    }
  }

  PageRouteBuilder _createFadeTransitionRoute() {
  const Duration transitionDuration = Duration(milliseconds: 1200);

  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.easeInOut;

      var fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

      return FadeTransition(
        opacity: fadeAnimation, // Just fade the whole page in
        child: child,
      );
    },
    transitionDuration: transitionDuration,
  );
}


  @override
  Widget build(BuildContext context) {
    // Calculate the screen size
    final size = MediaQuery.of(context).size;
    final finalSize = size.height > size.width ? size.height * 2 : size.width * 2;

    return Scaffold(
      backgroundColor: const Color(0xff141218),
      body: Center(
        child: EclipseAnimation(
          finalSize: finalSize, // Pass the final size for the second animation
          onFirstAnimationComplete: () {
            _firstAnimationCompleter.complete(); // Notify when first animation finishes
          },
          onSecondAnimationComplete: () {
            _secondAnimationCompleter.complete(); // Notify when second animation finishes
          },
        ),
      ),
    );
  }
}
