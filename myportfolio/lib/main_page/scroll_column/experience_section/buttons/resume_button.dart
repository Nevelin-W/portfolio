import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show Uint8List, rootBundle;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html; // For web-specific logic
import 'dart:io' as io; // For mobile (iOS/Android) platforms
import 'package:path_provider/path_provider.dart'; // For file system access

class ResumeButton extends StatefulWidget {
  const ResumeButton({super.key});

  @override
  ResumeButtonState createState() => ResumeButtonState();
}

class ResumeButtonState extends State<ResumeButton> {
  // Method to handle downloading the resume for mobile platforms
  Future<void> _downloadResumeMobile(Uint8List bytes) async {
    try {
      final directory = await getTemporaryDirectory();
      final file = io.File('${directory.path}/resume.pdf');
      await file.writeAsBytes(bytes);

      if (!mounted) return;

      // Show SnackBar with option to open the file
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Resume downloaded to ${file.path}'),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () {
              // Add logic to open the PDF if needed
            },
          ),
        ),
      );
    } catch (e) {
      _showErrorSnackBar('Failed to save resume: $e');
    }
  }

  // Method to handle downloading the resume for web
  void _downloadResumeWeb(Uint8List bytes) {
    try {
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      // ignore: unused_local_variable
      final anchor = html.AnchorElement(href: url)
        ..setAttribute("download", "resume.pdf")
        ..click();
      html.Url.revokeObjectUrl(url); // Clean up the object URL
    } catch (e) {
      _showErrorSnackBar('Failed to download resume: $e');
    }
  }

  // Common error handler for SnackBar
  void _showErrorSnackBar(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // Main method to handle the resume download process
  Future<void> _downloadResume() async {
    try {
      // Load the resume file from assets
      final byteData = await rootBundle.load('assets/resume.pdf');
      final bytes = byteData.buffer.asUint8List();

      if (kIsWeb) {
        _downloadResumeWeb(bytes);
      } else {
        _downloadResumeMobile(bytes);
      }
    } catch (e) {
      _showErrorSnackBar('Error downloading resume: $e');
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
            style: theme.textTheme.bodyLarge?.copyWith(
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
