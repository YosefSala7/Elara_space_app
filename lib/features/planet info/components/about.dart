import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';

class AboutSection extends StatelessWidget {
  AboutSection({super.key,required this.about});
  String about;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 8,
      children: [
        Text(context.tr("About"), style: Theme.of(context).textTheme.headlineSmall),
        Text(about, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
