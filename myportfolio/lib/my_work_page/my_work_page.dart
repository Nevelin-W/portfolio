import 'package:flutter/material.dart';

class MyWorkPage extends StatelessWidget {
const MyWorkPage({ super.key });

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(child: Center(
          child: Text(
            "My work page Content",
            style: theme.textTheme.bodyMedium, // Use theme text style
          ),
        ));
  }
}