import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onboarding_animation.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onbording_controller.dart';
import '../../data/models/onboarding_model.dart';

import '../widgets/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  static String onboardingRout = "/onboarding";
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();

  int currentPage = 0;

  void nextPage() {
    if (currentPage < onboardingScreens.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipPage() {
    pageController.animateToPage(
      onboardingScreens.length - 1,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: onboardingScreens.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return OnboardingContent(model: onboardingScreens[index]);
            },
          ),
          OnboardingAnimation(pageController: pageController),
          OnbordingController(
            currentPage: currentPage,
            pageIndex: onboardingScreens.length,
            pageController: pageController,
            onNext: nextPage,
            onSkip: skipPage,
          ),
        ],
      ),
    );
  }
}
