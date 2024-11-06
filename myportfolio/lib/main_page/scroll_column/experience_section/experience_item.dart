import 'package:flutter/material.dart';

class ExperienceItem extends StatefulWidget {
  final String startDate;
  final String endDate;
  final String title;
  final String description;
  final List<String> techList;

  const ExperienceItem({
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.description,
    required this.techList,
    super.key,
  });

  @override
  _ExperienceItemState createState() => _ExperienceItemState();
}

class _ExperienceItemState extends State<ExperienceItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.black.withOpacity(0.7) : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.startDate,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: ' — ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.primary,
                            fontSize: theme.textTheme.bodyMedium!.fontSize,
                          ),
                        ),
                        TextSpan(
                          text: widget.endDate,
                          style: theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 10),
                  TechStackChips(techList: widget.techList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TechStackChips Widget (Separate widget for the technology stack)
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
            ),
          )
          .toList(),
    );
  }
}
