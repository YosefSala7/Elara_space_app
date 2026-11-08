import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/features/settings/presenter/components/custome_row.dart';
import 'package:space_app/features/settings/presenter/components/lang_button.dart';
import 'package:space_app/features/settings/presenter/components/settings_card.dart';

class SettingsPage extends StatelessWidget {
  static String settingsRoutName = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            // child: Assets.icons.iconsaxSaveMinus.svg(
            //   colorFilter: ColorFilter.mode(Colors.blue, BlendMode.srcIn),
            // ),
            children: [
              Text(
                "Settings",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                  fontWeight: .bold,
                ),
              ),
              SizedBox(height: 20),

              SettingsCard(
                children: [
                  CustomeRow(
                    title: "Language",
                    icon: Assets.icons.iconsaxLanguageCircle.svg(),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LangButton(text: 'English'),
                      LangButton(text: 'Arabic'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),
              SettingsCard(
                children: [
                  CustomeRow(
                    title: 'Contact Us',
                    icon: Assets.icons.iconsaxMessageBubble.svg(),
                    onTap: () {},
                  ),

                  CustomeRow(
                    title: 'About Us',
                    icon: Assets.icons.iconsaxChart.svg(),
                    onTap: () {},
                  ),

                  CustomeRow(
                    title: 'Privacy Policy',
                    icon: Assets.icons.vector22.svg(),
                    onTap: () {},
                  ),

                  CustomeRow(
                    title: 'Terms & Conditions',
                    icon: Assets.icons.iconsaxSaveMinus.svg(),
                    onTap: () {},
                  ),

                  CustomeRow(
                    title: 'Log Out',
                    icon: Assets.icons.logoutSvgrepoCom.svg(),
                    onTap: () {},
                  ),
                ],
              ),

              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Assets.images.worldwide11.image(width: 50, height: 50),
                    Text(
                      "ELARA",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "By: Three dots",
                      style: TextStyle(
                        color: AppColors.cascaraColor,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
