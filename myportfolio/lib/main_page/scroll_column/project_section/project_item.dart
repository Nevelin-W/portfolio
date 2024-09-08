import 'package:flutter/material.dart';

class ProjectItem extends StatefulWidget {
  final IconData icon; // New parameter for the icon
  final String title;
  final String description;
  final List<String> techList; // List of tech used

  const ProjectItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.techList, // Initialize techList
    super.key,
  });

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.grey.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              widget.icon,
              size: 30,
              color: _isHovered ? Colors.black : Colors.grey,
            ),
            SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0, // Space between tech bubbles
                    runSpacing: 8, // Space between rows of tech bubbles
                    children: widget.techList.map((tech) {
                      return Chip(
                        label: Text(
                          tech,
                          style: TextStyle(
                            color: Colors.white, // Adjust text color for better contrast
                            fontSize: 10, // Slightly larger font size
                            fontWeight: FontWeight.w400, // Bold text for emphasis
                          ),
                        ),
                        backgroundColor: Colors.black.withOpacity(0.2), // Softer background color with a slight blue tint
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners for a modern feel
                          side: BorderSide(color: Colors.black.withOpacity(0.2), width: 1.5), // Subtle border color and width
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
