import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class CustomeRow extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onTap;
  final bool showArrow;

  const CustomeRow({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 20,
              child: icon,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                  fontSize: 16,
                  fontFamily: FontFamily.spaceGrotesk,
                ),
              ),
            ),
            if (showArrow)
              Icon(Icons.chevron_right, color: AppColors.primary, size: 24),
          ],
        ),
      ),
    );
  }
}
