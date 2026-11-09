import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.text, required this.img});
  String text;
  dynamic img;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: .w400,
              fontSize: 12,
              fontFamily: FontFamily.spaceGrotesk,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(3),
          alignment: Alignment.center,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          width: 155,
          height: 40,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextField(
              cursorColor: AppColors.primary,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                icon: img,
                border: .none,
                isDense: true,
              ),
            ),
          ),
        ).asGlass(
          clipBorderRadius: .circular(16),
          tintColor: Colors.white.withValues(alpha: 0.09),
        ),
      ],
    );
  }
}
