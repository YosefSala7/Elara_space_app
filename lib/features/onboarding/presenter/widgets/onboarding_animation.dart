import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class OnboardingAnimation extends StatelessWidget {
  final PageController pageController;

  const OnboardingAnimation({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return AnimatedBuilder(
              animation: pageController,
              builder: (context, child) {
                final page = pageController.hasClients
                    ? (pageController.page ?? 0).clamp(0.0, 2.0).toDouble()
                    : 0.0;

                final current = page.floor();
                final next = (current + 1).clamp(0, 2);
                final progress = page - current;

                final leftPositions = [
                  -width * 0.20,
                  width * 0.48,
                  width * 0.20,
                ];
                final topPositions = [
                  -height * 0.09,
                  height * 0.70,
                  height * 0.10,
                ];
                final sizes = [width * 0.65, width * 0.65, width * 0.60];

                final left = lerpDouble(
                  leftPositions[current],
                  leftPositions[next],
                  progress,
                )!;
                final top = lerpDouble(
                  topPositions[current],
                  topPositions[next],
                  progress,
                )!;
                final size = lerpDouble(sizes[current], sizes[next], progress)!;

                return Stack(
                  children: [
                    Positioned(
                      left: left,
                      top: top,
                      width: size,
                      height: size,
                      child: child!,
                    ),
                  ],
                );
              },
              child: Assets.imgs.earth.image(fit: BoxFit.contain),
            );
          },
        ),
      ),
    );
  }
}
