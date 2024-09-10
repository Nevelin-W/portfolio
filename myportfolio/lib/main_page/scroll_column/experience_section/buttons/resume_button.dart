import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io' as io; // for mobile platforms
import 'package:path_provider/path_provider.dart'; // for mobile platforms
import 'package:flutter/foundation.dart' show kIsWeb; // To check if it's web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class ResumeButton extends StatefulWidget {
  const ResumeButton({super.key});

  @override
  ResumeButtonState createState() => ResumeButtonState();
}

class ResumeButtonState extends State<ResumeButton> {
  Future<void> _downloadResume() async {
    try {
      // Load the resume file from assets
      final byteData = await rootBundle.load('assets/resume.pdf');
      final bytes = byteData.buffer.asUint8List();

      if (kIsWeb) {
        // Web-specific logic: Create a download link and trigger the download
        final blob = html.Blob([bytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        // ignore: unused_local_variable
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "resume.pdf")
          ..click();
        html.Url.revokeObjectUrl(url); // Clean up the object URL
      } else {
        // Mobile (iOS/Android) logic: Save to the temporary directory
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/resume.pdf');
        await file.writeAsBytes(bytes);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Resume downloaded to ${file.path}'),
            action: SnackBarAction(
              label: 'Open',
              onPressed: () {
                // Add logic to open the PDF file if needed
              },
            ),
          ),
        );
      }
    } catch (e, stackTrace) {
      print('Error downloading resume: $e');
      print('StackTrace: $stackTrace');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to download resume'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextButton(
      onPressed: _downloadResume,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        overlayColor: Colors.transparent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'View Full Resume',
            style: theme.textTheme.bodyLarge!.copyWith(
              shadows: [
                Shadow(
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(2.0, 2.0),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8), // Spacing between text and icon
          Icon(
            Icons.arrow_forward,
            color: theme.colorScheme.primary,
            size: 20,
            shadows: [
              Shadow(
                blurRadius: 2,
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(2.0, 2.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
