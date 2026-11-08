import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';

class CustomeRow extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback onTap;
  const CustomeRow({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.whiteColor,
              radius: 20,
              child: icon,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontFamily: "SpaceGrotesk",
                ),
              ),
            ),
            Icon(Icons.chevron_right, color: AppColors.iconColor),
          ],
        ),
      ),
    );
  }
}
