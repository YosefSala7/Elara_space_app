import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:space_app/features/onboarding/presenter/manager/cubit/onboarding_cubit.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onboarding_art.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onboarding_content.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onboarding_rocket.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onbording_controller.dart';

class OnboardingScreen extends StatefulWidget {
  static String onboardingRout = "/onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final cubit = OnboardingCubit();
  final pageController = PageController();

  final rocketModel = onboardingScreens.firstWhere((model) => model.isRocket);

  void syncPage(int page) {
    if (pageController.hasClients && pageController.page?.round() != page) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    cubit.close();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocListener<OnboardingCubit, int>(
        bloc: cubit,
        listener: (context, page) => syncPage(page),
        child: Stack(
          children: [
            PageView.builder(
              controller: pageController,
              itemCount: onboardingScreens.length,
              onPageChanged: cubit.changePage,
              itemBuilder: (context, index) {
                final model = onboardingScreens[index];

                return Stack(
                  fit: StackFit.expand,
                  children: [
                    if (!model.isRocket) OnboardingArt(model: model),
                    OnboardingContent(model: model),
                  ],
                );
              },
            ),
            Positioned.fill(
              child: BlocSelector<OnboardingCubit, int, bool>(
                bloc: cubit,
                selector: (page) => onboardingScreens[page].isRocket,
                builder: (context, visible) =>
                    OnboardingRocket(model: rocketModel, visible: visible),
              ),
            ),
            BlocBuilder<OnboardingCubit, int>(
              bloc: cubit,
              builder: (context, page) => OnbordingController(
                currentPage: page,
                pageIndex: onboardingScreens.length,
                pageController: pageController,
                onNext: cubit.next,
                onSkip: cubit.skip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
