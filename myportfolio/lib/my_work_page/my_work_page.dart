import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8, // Adjust the width of the overall container
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align columns at the top
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between the columns
            children: [
              // Column 1
              Flexible(
                flex: 1,
                
                child: Container(
                  color: Colors.blueGrey[900],
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title Text at the top
                      Text(
                        'Roberts Kārlis Šmits',
                        style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'DevOps Engineer',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "I streamline and automate infrastructure, ensuring reliable, scalable,\nand efficient delivery of software.",
                        style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 15),
                      ),
                      
                      SizedBox(height: 20),

                      // Navigation links
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Handle About section click
                            },
                            child: Text('About', style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Experience section click
                            },
                            child: Text('Experience', style: TextStyle(color: Colors.white)),
                          ),
                          TextButton(
                            onPressed: () {
                              // Handle Projects section click
                            },
                            child: Text('Projects', style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      Spacer(),

                      // LinkedIn and GitHub Icons at the bottom
                      Row(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                            onPressed: () {
                              // Handle LinkedIn click
                            },
                          ),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.github, color: Colors.white),
                            onPressed: () {
                              // Handle GitHub click
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 20), // Space between the columns

              // Column 2
              Flexible(
                flex: 1,
                child: Container(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "I'm a passionate DevOps Engineer and Flutter Enthusiast with a strong background in mobile development. Currently pursuing my studies at RTU Information Technologies, I am a lifelong learner eager to tackle new challenges.",
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 30),
                      
                          // Experience Section
                          Text(
                            'Experience',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2024-Present',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      'DevOps Engineer\nWorking with Linux',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '2023-2024',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 20),
                                  Expanded(
                                    child: Text(
                                      'Junior DevOps Engineer\nWorking with Ansible',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          TextButton(
                            onPressed: () {
                              // Handle View Full Resume click
                            },
                            child: Text('View Full Resume', style: TextStyle(fontSize: 16)),
                          ),
                          SizedBox(height: 30),
                      
                          // Recent Personal Projects Section
                          Text(
                            'Recent Personal Projects',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          // You can add more project descriptions here
                          Text(
                            '1. Flutter Chat App: A real-time chat application using Flutter and Firebase.',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '2. DevOps CI/CD Pipeline: Implemented a CI/CD pipeline using Jenkins, Docker, and Kubernetes.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
