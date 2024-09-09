import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class IconLinkButton extends StatelessWidget {
  final IconData icon;
  final String url;
  final Color buttonColor;

  const IconLinkButton(
      {super.key,
      required this.icon,
      required this.url,
      required this.buttonColor});

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
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(10),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      icon: FaIcon(
        icon,
        color: buttonColor,
        shadows: [
          Shadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(2.0, 2.0),
          ),
        ],
      ),
      onPressed: _launchURL,
    );
  }
}
