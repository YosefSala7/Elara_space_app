import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/components/branding.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/settings/presenter/components/custome_row.dart';
import 'package:space_app/features/settings/presenter/components/lang_selector.dart';
import 'package:space_app/features/settings/presenter/components/settings_card.dart';

import 'package:flutter_animate/flutter_animate.dart';

class SettingsPage extends StatelessWidget {
  static String settingsRoutName = '/settings';
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                    "Settings",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 24,
                      fontFamily: FontFamily.audiowide,
                    ),
                  )
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: -0.2, end: 0),
      
              SettingsCard(
                    children: [
                      CustomeRow(
                            title: "Language",
                            icon: Assets.icons.iconsaxLanguageCircle.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                            showArrow: false,
                          )
                          .animate()
                          .fadeIn(delay: 200.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
      
                      LanguageSelector()
                          .animate()
                          .fadeIn(delay: 300.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
                    ],
                  )
                  .animate()
                  .fadeIn(delay: 100.ms, duration: 400.ms)
                  .slideY(begin: 0.3, end: 0),
      
              SettingsCard(
                    children: [
                      CustomeRow(
                            title: 'Contact Us',
                            icon: Assets.icons.iconsaxMessageBubble.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          )
                          .animate()
                          .fadeIn(delay: 400.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
      
                      const Divider(height: 3),
      
                      CustomeRow(
                            title: 'About Us',
                            icon: Assets.icons.iconsaxChart.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          )
                          .animate()
                          .fadeIn(delay: 500.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
      
                      const Divider(height: 3),
      
                      CustomeRow(
                            title: 'Privacy Policy',
                            icon: Assets.icons.vector22.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          )
                          .animate()
                          .fadeIn(delay: 600.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
      
                      const Divider(height: 3),
      
                      CustomeRow(
                            title: 'Terms & Conditions',
                            icon: Assets.icons.iconsaxSaveMinus.svg(
                              colorFilter: const ColorFilter.mode(
                                AppColors.primary,
                                BlendMode.srcIn,
                              ),
                            ),
                            onTap: () {},
                          )
                          .animate()
                          .fadeIn(delay: 700.ms, duration: 400.ms)
                          .slideY(begin: 0.2, end: 0),
                    ],
                  )
                  .animate()
                  .fadeIn(delay: 300.ms, duration: 400.ms)
                  .slideY(begin: 0.3, end: 0),
      
              const Center(child: Branding())
                  .animate()
                  .fadeIn(delay: 800.ms, duration: 400.ms)
                  .scale(
                    begin: const Offset(0.8, 0.8),
                    end: const Offset(1, 1),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
