import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    super.key,
    required this.children,
    this.effectEnabled = true,
    this.liquid = false,
  });

  final List<Widget> children;
  final bool effectEnabled;
  final bool liquid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(children: children),
    ).asGlass(
      enabled: effectEnabled,
      blurX: 4,
      blurY: 4,
      tintColor: Colors.white.withValues(alpha: 0.12),
      clipBorderRadius: BorderRadius.circular(30),
      frosted: false,
    );
  }
}
