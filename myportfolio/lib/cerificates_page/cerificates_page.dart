import 'package:flutter/material.dart';

class CertificatesPage extends StatelessWidget {
const CertificatesPage({ super.key });

  @override
  Widget build(BuildContext context){
    final theme = Theme.of(context);
    return Container(child: Center(
          child: Text(
            "Certificates page Content",
            style: theme.textTheme.bodyMedium, // Use theme text style
          ),
        ));
  }
}