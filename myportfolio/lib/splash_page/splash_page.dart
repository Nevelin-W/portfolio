import 'package:flutter/material.dart';
import 'dart:async'; // Required for Completer
import 'package:myportfolio/main_page/main_page.dart';
import 'package:myportfolio/splash_page/eclipse_animation.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  // Initialize completers for asynchronous handling of animations
  final Completer<void> _firstAnimationCompleter = Completer<void>();
  final Completer<void> _secondAnimationCompleter = Completer<void>();

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  // Navigates to MainPage after both animations complete
  Future<void> _navigateToHome() async {
    if (!mounted) return; // Early check for widget mounting
    try {
      await _firstAnimationCompleter.future;  // Wait for the first animation
      await _secondAnimationCompleter.future; // Wait for the second animation
    } catch (e) {
      // Handle any unexpected completion errors
      debugPrint("Animation error: $e");
    }

    if (mounted) {
      Navigator.pushReplacement(
        context,
        _createFadeTransitionRoute(),
      );
    }
  }

  // Creates a custom page route with a fade transition effect
  PageRouteBuilder _createFadeTransitionRoute() {
    const Duration transitionDuration = Duration(milliseconds: 1200);
    const curve = Curves.easeInOut;

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => const MainPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final fadeAnimation = CurvedAnimation(parent: animation, curve: curve);
        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
      transitionDuration: transitionDuration,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Calculate screen size once for performance
    final size = MediaQuery.of(context).size;
    final finalSize = size.height > size.width ? size.height * 2 : size.width * 2;

    return Scaffold(
      backgroundColor: const Color(0xff141218),
      body: Center(
        child: EclipseAnimation(
          finalSize: finalSize, // Pass calculated final size to the animation
          onFirstAnimationComplete: () => _firstAnimationCompleter.complete(), // Trigger when first animation finishes
          onSecondAnimationComplete: () => _secondAnimationCompleter.complete(), // Trigger when second animation finishes
        ),
      ),
    );
  }
}