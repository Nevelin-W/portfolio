import 'package:flutter/material.dart';

class MyWorkRow extends StatelessWidget {
  const MyWorkRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 130, right: 130),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Column 1: Colored boxes representing projects
          Expanded(
            // <-- Wrap this Column in Expanded
            child: Column(
              children: [
                // First project box - aligned left
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 600,
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white, // First box color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '01 Portfolio',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.web, // Example icon representing the project
                            color: Colors.black,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Second project box - aligned right
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 600,
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white, // Second box color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                           Text(
                            '02 TO-DO App',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                          
                          ),
                          const Spacer(),
                          Icon(
                            Icons
                                .phone_android_rounded, // Example icon representing the project
                            color: Colors.black,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                // Third project box - aligned left
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  
                  children: [
                    Container(
                      width: 600,
                      height: 150,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white, // Third box color
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                           Text(
                            '03 GIF Search App',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
                          
                          ),
                          const Spacer(),
                          Icon(
                            Icons.gif, // Example icon representing the project
                            color: Colors.black,
                            size: 50,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 40),
          // Column 2: Descriptions of the projects
          Expanded(
            // <-- Wrap this Column in Expanded
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Description for the first project
                Container(
                  padding: EdgeInsets.all(20),
                  width: 700,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Project 01: A coding project where I developed a fully responsive web application using Flutter.\n\nProject 02: Developed a flutter mobile app with firebase\n\nProject 03: Developed a mobile app that iteracts with an external api',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
