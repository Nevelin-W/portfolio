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
  late Completer<void> _animationCompleter;

  @override
  void initState() {
    super.initState();
    _animationCompleter = Completer<void>();
    _navigateToHome();
  }

  _navigateToHome() async {
    await _animationCompleter.future; // Wait for the animation to complete
    if (mounted) {
      Navigator.pushReplacement(
        context,
        _createZoomInTransitionRoute(),
      );
    }
  }

  PageRouteBuilder _createZoomInTransitionRoute() {
    const Duration transitionDuration = Duration(milliseconds: 500);

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween<double>(begin: begin, end: end).chain(CurveTween(curve: curve));
        var scaleAnimation = animation.drive(tween);
        var fadeAnimation = CurvedAnimation(parent: animation, curve: curve);

        return ScaleTransition(
          scale: scaleAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
      transitionDuration: transitionDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141218),
      body: Center(
        child: EclipseAnimation(
          onAnimationComplete: () {
            _animationCompleter.complete();
          },
        ),
      ),
    );
  }
}