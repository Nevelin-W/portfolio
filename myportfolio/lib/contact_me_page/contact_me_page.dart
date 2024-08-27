import 'package:flutter/material.dart';

class ContactMePage extends StatelessWidget {
const ContactMePage({ super.key });

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(child: Center(
          child: Text(
            "Contact me page Content",
            style: theme.textTheme.bodyMedium, // Use theme text style
          ),
        ));
  }
}