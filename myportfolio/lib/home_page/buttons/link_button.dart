import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle style;

  const LinkButton({
    super.key,
    required this.text,
    required this.url,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero,
      ),
      onPressed: () => _launchUrl(Uri.parse(url)),
      child: Text(text, style: style),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
