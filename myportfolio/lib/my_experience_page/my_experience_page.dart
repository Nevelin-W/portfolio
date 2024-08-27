import 'package:flutter/material.dart';

class MyExperiencePage extends StatelessWidget {
const MyExperiencePage({ super.key });

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(child: Center(
          child: Text(
            "My expierience page Content",
            style: theme.textTheme.bodyMedium, // Use theme text style
          ),
        ));
  }
}