import 'package:space_app/core/gen/assets.gen.dart';

class OnboardingModel {
  final String label;
  final String title;
  final String description;

  final LottieGenImage? lottie;
  final double scale;
  final double top;

  final bool isRocket;

  OnboardingModel({
    required this.label,
    required this.title,
    required this.description,
    this.lottie,
    this.scale = 1.0,
    this.top = 0.15,
    this.isRocket = false,
  });
}

final List<OnboardingModel> onboardingScreens = [
  OnboardingModel(
    label: '01 — LIFTOFF',
    title: "You've reached space",
    description:
        'Your journey starts here. Fly through the solar system and meet every planet up close.',
    lottie: Assets.lotties.astronautWithTablet,
    isRocket: true,
    scale: 0.9,
    top: 0.20,
  ),
  OnboardingModel(
    label: '02 — DISCOVER',
    title: 'Hello, explorer!',
    description:
        'Your astronaut guide is ready. Learn real facts about every planet, one mission at a time.',
    lottie: Assets.lotties.astronautSayHello,
    scale: 1.0,
    top: 0.20,
  ),
  OnboardingModel(
    lottie: Assets.lotties.astronautHello,
    label: '03 — EXPERIENCE',
    title: 'What would you weigh on Mars?',
    description:
        'Compare your weight and age on every planet with real gravity data, then share it with friends.',
    scale: 0.9,
    top: 0.20,
  ),
];
