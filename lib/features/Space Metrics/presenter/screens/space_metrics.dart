import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/Space%20Metrics/presenter/components/custom_text_field.dart';

class SpaceMetrics extends StatelessWidget {
  const SpaceMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 30,
          crossAxisAlignment: .start,

          children: [
            Center(
              child: Text(
                textAlign: .center,
                "Space Metrics",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: .w500,
                  color: AppColors.white,
                  fontFamily: FontFamily.audiowide,
                ),
              ),
            ),
            Text(
              textAlign: .justify,
              "Your Normal information :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w500,
                color: AppColors.white,
                fontFamily: FontFamily.audiowide,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  CustomTextField(
                    text: "Weight",
                    img:Assets.icons.iconsaxWeight.svg(),
                  ),
                  Spacer(),
                  CustomTextField(
                    text: "Age",
                    img: Assets.icons.ageRange7187713.image(width: 16,color: AppColors.white),
                  ),
                ],
              ),
            ),
            Text(
              textAlign: .start,
              "Your Information in Space:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w500,
                color: AppColors.white,
                fontFamily: FontFamily.audiowide,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Row(
                children: [
                  CustomTextField(
                    text: "Weight",
                    img: Assets.icons.iconsaxWeight.svg(),
                  ),
                  Spacer(),
                  CustomTextField(
                    text: "Age",
                    img: Assets.icons.ageRange7187713.image(width: 16,color: AppColors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
