import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/content/info_column.dart';
import 'package:myportfolio/home_page/content/animated_triangle.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: IntrinsicWidth(
                child: InfoColumn(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: const IntrinsicWidth(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [AnimatedTriangle()],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: const Expanded(
                child: Column(
                  children: [Text("joke")],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
