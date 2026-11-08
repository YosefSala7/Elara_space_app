import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.whiteColor.withValues(alpha: 0.10),
                AppColors.whiteColor.withValues(alpha: 0.03),
              ],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.whiteColor.withValues(alpha: 0.12),
            ),
          ),
          child: Column(children: children),
        ),
      ),
    );
  }
}
