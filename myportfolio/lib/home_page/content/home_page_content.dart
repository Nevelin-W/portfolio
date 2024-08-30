import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/content/info_column.dart';
import 'package:myportfolio/home_page/content/animated_triangle.dart';
import 'package:myportfolio/home_page/content/joke_column.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(left: 120, right: 120, top: 150),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: InfoColumn(),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [AnimatedTriangle()],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(color: Colors.black, child: JokeColumn()),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  child: Text("test"),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
