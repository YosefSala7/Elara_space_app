import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:space_app/core/app_colors.dart';

class PageIndictor extends StatelessWidget {
  final PageController pageController;
  final int pageIndex;
  const PageIndictor({
    super.key,
    required this.pageController,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: pageIndex,
      effect: ExpandingDotsEffect(
        dotHeight: 7,
        dotWidth: 7,
        spacing: 6,
        radius: 10,
        dotColor: AppColors.white,
        activeDotColor: AppColors.primary,
      ),
    );
  }
}
