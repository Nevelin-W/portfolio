import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/content/info_column.dart';
import 'package:myportfolio/home_page/content/joke_column.dart';
import 'package:myportfolio/home_page/content/my_work_row.dart';

class HomePageContent extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  HomePageContent({super.key});

  void _scrollToWorkSection() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: ColoredBox(
        color: Colors.black,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 200, left: 130, right: 130),
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: InfoColumn(
                              onSeeMyWorkPressed: _scrollToWorkSection),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: const JokeColumn(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 80), // Space before the vertical line
                  Container(
                    height: 500,
                    child: const VerticalDivider(
                      color: Colors.white,
                      thickness: 2,
                      width: 10,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
            MyWorkRow(),
          ],
        ),
      ),
    );
  }
}
