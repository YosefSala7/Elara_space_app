import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/Space%20Metrics/data/models/planet_model.dart';
import 'package:space_app/features/Space%20Metrics/presenter/components/custom_text_field.dart';
import 'package:space_app/features/Space%20Metrics/presenter/screens/planet_list.dart';

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
                    img: Assets.icons.iconsaxWeight.svg(width: 20),
                  ),
                  Spacer(),
                  CustomTextField(
                    text: "Age",
                    img: Assets.icons.fiRrCalendar.svg(
                      color: AppColors.white,
                      width: 17,
                    ),
                  ),
                ],
              ),
            ),
         PlanetList(),
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
                    img: Assets.icons.iconsaxWeight.svg(width: 20),
                  ),
                  Spacer(),
                  CustomTextField(
                    text: "Age",
                    img: Assets.icons.fiRrCalendar.svg(
                      color: AppColors.white,
                      width: 17,
                    ),
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
