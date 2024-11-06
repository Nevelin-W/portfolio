import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> techList;
  final String url;

  const ProjectItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.techList,
    required this.url,
    super.key,
  });

  @override
  ProjectItemState createState() => ProjectItemState();
}

class ProjectItemState extends State<ProjectItem> {
  bool _isHovered = false;
  Offset _mousePosition = Offset.zero;

  // Function to open the URL with error handling
  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(widget.url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, webOnlyWindowName: '_blank');
      }
    } catch (e) {
      debugPrint('Could not launch ${widget.url}: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: _launchURL,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        onHover: (details) =>
            setState(() => _mousePosition = details.localPosition),
        child: Stack(
          children: [
            // Background container with hover effect
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _isHovered
                    ? Colors.black.withOpacity(0.7)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(6),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(widget.icon, size: 25, color: theme.colorScheme.primary),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 10),
                        Text(widget.description,
                            style: theme.textTheme.bodyMedium),
                        const SizedBox(height: 10),
                        TechStackChips(
                            techList: widget.techList), // Keep tech stack as is
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Tooltip when hovered
            if (_isHovered)
              Positioned(
                left: _mousePosition.dx + 10,
                top: _mousePosition.dy - 10,
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    'Try Clicking!',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Separate widget for the tech stack chips
class TechStackChips extends StatelessWidget {
  final List<String> techList;

  const TechStackChips({required this.techList, super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: techList
          .map(
            (tech) => Chip(
              label: Text(
                tech,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
              backgroundColor: const Color.fromARGB(255, 42, 51, 59),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(
                  color: Color.fromARGB(255, 42, 51, 59),
                  width: 0,
                ),
              ),

              materialTapTargetSize: MaterialTapTargetSize
                  .shrinkWrap, // Ensure the tap target size is appropriate
            ),
          )
          .toList(),
    );
  }
}
