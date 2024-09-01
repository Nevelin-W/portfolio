import 'package:flutter/material.dart';
import 'package:myportfolio/home_page/content/info_column.dart';
import 'package:myportfolio/home_page/content/joke_column.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black,
      
        child: Container(
          margin: EdgeInsets.only(top: 60, left: 60, right: 60),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20), // Rounded corners
            border: Border.all(
              color: Colors.white, 
              
              width: 2.5, // Border width
            ),
          ),
          padding: EdgeInsets.all(25),
          child: Column(
            
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: InfoColumn(),
                    ),
                  ),
                 
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: JokeColumn(),
                    ),
                  )
                ],
              ),
              
                Container(
                  height: 10,
                  color: Colors.white,
                )
          
              
              
            ],
          ),
        ),
      
    );
  }
}
