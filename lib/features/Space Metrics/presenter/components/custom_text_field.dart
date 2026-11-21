import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Widget img;
  final TextEditingController controller;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.text,
    required this.img,
    required this.controller,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white.withValues(alpha: .1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.white.withValues(alpha: .2),
        ),
      ),
      child: Row(
        children: [
          img,
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(
                color: AppColors.white,
                fontFamily: FontFamily.spaceGrotesk,
              ),
              decoration: InputDecoration(
                hintText: text,
                hintStyle: TextStyle(
                  color: AppColors.white.withValues(alpha: .6),
                  fontSize: 13,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}