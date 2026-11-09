import 'package:flutter/material.dart';
import 'package:liquid_glass_bottom_navbar_plus/liquid_glass_bottom_navbar_plus.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});
  static const layoutRoute = "/layout";
  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: LiquidGlassBottomBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          swipeToSelect: true,
          settings: LiquidGlassSettings(
            thickness: 4.0,
            blur: 20.0,
            refractiveIndex: 1.15,
            lightAngle: -0.785398,
            lightIntensity: 0.5,
            ambientStrength: 0.4,
            glassColor: const Color.fromARGB(3, 255, 255, 255),
            saturation: 1.3,
            chromaticAberration: 0.02,
            outlineIntensity: 0.3,
            blend: 16.0,
            tiltHighlight: true,
          ),
          theme: LiquidGlassBarTheme(
            labelStyle: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 10, fontWeight: .w500),
            selectedLabelStyle: Theme.of(
              context,
            ).textTheme.labelSmall!.copyWith(fontSize: 10, fontWeight: .w700),
            iconColor: Colors.grey,
            selectedIconColor: AppColors.primary,
            pillColor: AppColors.primary.withAlpha(30),
          ),
          items: [
            LiquidGlassBarItem(
              icon: Assets.icons.navbar.broken.home.svg(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: Assets.icons.navbar.bold.home.svg(
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              label: "Home",
            ),
            LiquidGlassBarItem(
              icon: Assets.icons.navbar.broken.measuringTape.image(
                width: 20,
                color: Colors.grey,
              ),
              selectedIcon: Assets.icons.navbar.bold.measuringTape.image(
                width: 20,
                color: AppColors.primary,
              ),
              label: "Metrics",
            ),
            LiquidGlassBarItem(
              icon: Assets.icons.navbar.broken.videos.image(
                width: 20,
                color: Colors.grey,
              ),
              selectedIcon: Assets.icons.navbar.bold.videos.image(
                width: 20,
                color: AppColors.primary,
              ),
              label: "Learn",
            ),

            LiquidGlassBarItem(
              icon: Assets.icons.navbar.broken.paper.svg(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: Assets.icons.navbar.bold.paper.svg(
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              label: "Quizes",
            ),
            LiquidGlassBarItem(
              icon: Assets.icons.navbar.broken.setting.svg(
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              ),
              selectedIcon: Assets.icons.navbar.bold.setting.svg(
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcIn,
                ),
              ),
              label: "Home",
            ),
          ],
        ),
      ),
    );
  }
}
