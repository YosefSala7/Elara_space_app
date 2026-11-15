import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';

class ShareCard extends StatelessWidget {
  const ShareCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.primary,
      child: Container(
        width: 150,
        height: 150,
        child: Text("colorrr"),
      ),
    );
  }
}
