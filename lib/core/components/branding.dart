import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class Branding extends StatelessWidget {
  const Branding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 3,
      mainAxisAlignment: .center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: ShapeDecoration(shape: CircleBorder()),
          child: Icon(Icons.more_horiz, size: 15, color: AppColors.primary),
        ).asGlass(clipBorderRadius: BorderRadius.circular(16)),
        Text(
          "Three Dots",
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
            fontFamily: FontFamily.audiowide,
          ),
        ),
      ],
    );
  }
}
