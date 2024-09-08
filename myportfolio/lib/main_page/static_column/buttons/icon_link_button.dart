import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class IconLinkButton extends StatelessWidget {
  final IconData icon;
  final String url;

  const IconLinkButton({
    super.key,
    required this.icon,
    required this.url,
  });

  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: Colors.white),
      onPressed: _launchURL,
    );
  }
}
