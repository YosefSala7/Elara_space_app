import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coverflow_carousel/coverflow_carousel.dart';
import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/features/home/components/custom_arrow_button.dart';
import 'package:space_app/features/home/presenter/manager/planets_api_cubit.dart';
import 'package:space_app/features/home/presenter/manager/planets_api_states.dart';
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
                Text(context.tr("Explore"), style: textTheme.headlineSmall),
                Align(
                  alignment: AlignmentGeometry.topStart,
                  child: Text(
                    context.tr("Which planet\nwould you like to explore?"),
                    style: textTheme.headlineSmall,
                  ),
                ),
                BlocBuilder<PlanetsApiCubit, PlanetsState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return Skeletonizer.zone(
                        child: Column(
                          spacing: 24,
                          children: [
                            CoverflowCarousel.builder(
                              isInfinite: true,
                              initialPage: 0,
                              itemCount: 3,
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
                                return const Bone.circle(size: 260);
                              },
                            ),
                            Row(
                              children: [
                                CustomArrowButton(
                                  onTap: () {},
                                  direction: "left",
                                ),
                                const Spacer(),
                                Bone.text(
                                  words: 1,
                                  style: textTheme.headlineSmall,
                                ),
                                const Spacer(),
                                CustomArrowButton(
                                  onTap: () {},
                                  direction: "right",
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                    if (state.planets.isNotEmpty) {
                      return Column(
                        children: [
                          Directionality(
                            textDirection: .ltr,
                            child: CoverflowCarousel.builder(
                              isInfinite: true,
                              initialPage: _currentPage,
                              onPageChanged: (value) {
                                setState(() {
                                  _currentPage = value;
                                });
                              },

                              controller: _pageController,
                              entryAnimationDuration: const Duration(
                                milliseconds: 100,
                              ),
                              itemCount: state.planets.length,
                              elevation: 0,
                              itemWidth: 300,
                              itemHeight: 300,
                              scrollDirection: Axis.horizontal,

                              nearCardSpacing: 110,
                              farCardSpacing: 100,
                              skewAngle: -0.3,
                              obscure: 0.4,
                              enableShadow: false,
                              itemBuilder: (context, index) {
                                return OpenContainer(
                                  openBuilder: (context, action) =>
                                      PlanetInfo(planet: state.planets[index]),
                                  closedBuilder: (context, action) => Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: CachedNetworkImage(
                                      width: .infinity,
                                      height: .infinity,
                                      imageUrl: state.planets[index].images,
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) =>
                                          const Skeletonizer.zone(
                                            child: Bone.circle(size: 300),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.broken_image),
                                    ),
                                  ),
                                  closedShape: const CircleBorder(
                                    side: BorderSide.none,
                                  ),
                                  closedColor: Colors.transparent,
                                  closedElevation: 0,
                                );
                              },
                            ),
                          ),
                          Directionality(
                            textDirection: .ltr,
                            child: Row(
                              children: [
                                CustomArrowButton(
                                  onTap: () => _pageController.previous(),
                                  direction: "left",
                                ),
                                const Spacer(),
                                PageTransitionSwitcher(
                                  duration: const Duration(milliseconds: 300),
                                  transitionBuilder:
                                      (
                                        child,
                                        primaryAnimation,
                                        secondaryAnimation,
                                      ) {
                                        return FadeThroughTransition(
                                          animation: primaryAnimation,
                                          secondaryAnimation:
                                              secondaryAnimation,
                                          fillColor: Colors.transparent,
                                          child: child,
                                        );
                                      },
                                  child: Text(
                                    state.planets[_currentPage].name,
                                    key: ValueKey<int>(_currentPage),
                                    style: textTheme.headlineSmall,
                                  ),
                                ),
                                const Spacer(),
                                CustomArrowButton(
                                  onTap: () => _pageController.next(),
                                  direction: "right",
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }

                    if (state.planets.isNotEmpty) {
                      return Column(
                        spacing: 24,
                        children: [
                          CoverflowCarousel.builder(
                            isInfinite: false,
                            initialPage: _currentPage,
                            onPageChanged: (value) {
                              setState(() {
                                _currentPage = value;
                              });
                            },
                            controller: _pageController,
                            entryAnimationDuration: const Duration(
                              milliseconds: 100,
                            ),
                            itemCount: state.planets.length,
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
                                    PlanetInfo(planet: state.planets[index]),
                                closedBuilder: (context, action) =>
                                    CachedNetworkImage(
                                      imageUrl: state.planets[index].images,
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                          const Skeletonizer.zone(
                                            child: Bone.circle(size: 260),
                                          ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.broken_image),
                                    ),
                                closedShape: const CircleBorder(
                                  side: BorderSide.none,
                                ),
                                closedColor: Colors.transparent,
                                closedElevation: 0,
                              );
                            },
                          ),
                          Row(
                            children: [
                              CustomArrowButton(
                                onTap: () => _pageController.previous(),
                                direction: "left",
                              ),
                              const Spacer(),
                              PageTransitionSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder:
                                    (
                                      child,
                                      primaryAnimation,
                                      secondaryAnimation,
                                    ) {
                                      return FadeThroughTransition(
                                        animation: primaryAnimation,
                                        secondaryAnimation: secondaryAnimation,
                                        fillColor: Colors.transparent,
                                        child: child,
                                      );
                                    },
                                child: Text(
                                  state.planets[_currentPage].name,
                                  key: ValueKey<int>(_currentPage),
                                  style: textTheme.headlineSmall,
                                ),
                              ),
                              const Spacer(),
                              CustomArrowButton(
                                onTap: () => _pageController.next(),
                                direction: "right",
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return Column(
                      spacing: 12,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Assets.lotties.astronautSpaceErrorAnimationV2
                              .lottie(),
                        ),
                        Text(state.error ?? ""),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
