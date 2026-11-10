import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/features/home/presenter/screens/home_screen.dart';

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
    return Stack(
      children: [
        HomeScreen(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Align(
              alignment: .bottomCenter,
              child: LiquidGlassLayer(
                settings: LiquidGlassSettings.ios27Regular(
                  brightness: Brightness.dark,
                ),
                child: LiquidGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 40),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: BottomNavigationBar(
                      currentIndex: _index,
                      onTap: (index) {
                        setState(() {
                          _index = index;
                        });
                      },
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      selectedItemColor: AppColors.primary,
                      unselectedItemColor: Colors.grey,
                      showUnselectedLabels: false,
                      selectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                      items: [
                        // 1. Home
                        BottomNavigationBarItem(
                          icon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Assets.icons.navbar.broken.home.svg(
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          activeIcon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Assets.icons.navbar.bold.home.svg(
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          label: "Home",
                        ),

                        // 2. Metrics
                        BottomNavigationBarItem(
                          icon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Assets.icons.navbar.broken.measuringTape
                                  .image(width: 20, color: Colors.grey),
                            ),
                          ),
                          activeIcon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Assets.icons.navbar.bold.measuringTape
                                    .image(width: 20, color: AppColors.primary),
                              ),
                            ),
                          ),
                          label: "Metrics",
                        ),

                        // 3. Learn
                        BottomNavigationBarItem(
                          icon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Assets.icons.navbar.broken.videos.image(
                                width: 20,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          activeIcon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Assets.icons.navbar.bold.videos.image(
                                  width: 20,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                          ),
                          label: "Learn",
                        ),

                        // 4. Quizes
                        BottomNavigationBarItem(
                          icon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Assets.icons.navbar.broken.paper.svg(
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          activeIcon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Assets.icons.navbar.bold.paper.svg(
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          label: "Quizes",
                        ),

                        // 5. Settings
                        BottomNavigationBarItem(
                          icon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Assets.icons.navbar.broken.setting.svg(
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          activeIcon: SizedBox(
                            height: 36,
                            width: 50,
                            child: Center(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withAlpha(60),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Assets.icons.navbar.bold.setting.svg(
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.primary,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          label: "Settings",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

