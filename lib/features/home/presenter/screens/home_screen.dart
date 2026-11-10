import 'package:animations/animations.dart';
import 'package:coverflow_carousel/coverflow_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/home/components/custom_arrow_button.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';
import 'package:space_app/features/planet%20info/screens/planet_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const homeRoute = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CoverflowCarouselController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = CoverflowCarouselController();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 40,
              children: [
                Text("Explore", style: textTheme.headlineSmall)
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: -0.2, end: 0),

                Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Which planet\nwould you like to explore?",
                        style: textTheme.headlineSmall,
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 100.ms, duration: 400.ms)
                    .slideY(begin: -0.2, end: 0),

                CoverflowCarousel.builder(
                      initialPage: _currentPage,
                      onPageChanged: (value) {
                        setState(() {
                          _currentPage = value;
                        });
                      },
                      controller: _pageController,
                      entryAnimationDuration: const Duration(milliseconds: 100),
                      itemCount: planets.length,
                      elevation: 0,
                      itemWidth: 260,
                      itemHeight: 260,
                      scrollDirection: Axis.horizontal,
                      nearCardSpacing: 140,
                      farCardSpacing: 120,
                      skewAngle: -0.3,
                      obscure: 0.4,
                      enableShadow: false,
                      itemBuilder: (context, index) {
                        return OpenContainer(
                          openBuilder: (context, action) =>
                              PlanetInfo(planet: planets[index]),
                          closedBuilder: (context, action) =>
                              planets[index].img,
                          closedShape: const CircleBorder(
                            side: BorderSide.none,
                          ),
                          closedColor: Colors.transparent,
                          openColor: Colors.transparent,
                          transitionDuration: const Duration(milliseconds: 500),
                          closedElevation: 0,
                        );
                      },
                    )
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 500.ms)
                    .scale(
                      begin: const Offset(0.9, 0.9),
                      end: const Offset(1, 1),
                    ),

                Row(
                      children: [
                        CustomArrowButton(
                          onTap: () {
                            _pageController.previous();
                          },
                          direction: "left",
                        ),
                        const Spacer(),
                        PageTransitionSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (child, primaryAnimation, secondaryAnimation) {
                                return FadeThroughTransition(
                                  animation: primaryAnimation,
                                  secondaryAnimation: secondaryAnimation,
                                  fillColor: Colors.transparent,
                                  child: child,
                                );
                              },
                          child: Text(
                            planets[_currentPage].name,
                            key: ValueKey<int>(_currentPage),
                            style: textTheme.headlineSmall,
                          ),
                        ),
                        const Spacer(),
                        CustomArrowButton(
                          onTap: () {
                            _pageController.next();
                          },
                          direction: "right",
                        ),
                      ],
                    )
                    .animate()
                    .fadeIn(delay: 350.ms, duration: 400.ms)
                    .slideY(begin: 0.2, end: 0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
