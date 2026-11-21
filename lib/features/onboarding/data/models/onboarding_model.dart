class OnboardingModel {
  final String label;
  final String title;
  final String description;

  OnboardingModel({
    required this.label,
    required this.title,
    required this.description,
  });
}

List<OnboardingModel> onboardingScreens = [
  OnboardingModel(
    label: '01 — EXPLORE',
    title: 'Explore every world',
    description:
        'Travel across our digital planets, a modern-day guide built for curious minds.',
  ),
  OnboardingModel(
    label: '02 — LEARN',
    title: 'Explore every world',
    description:
        'See what you would weigh on a different world with accurate gravity comparisons.',
  ),
  OnboardingModel(
    label: '03 — EXPERIENCE',
    title: 'Feel other gravity',
    description:
        'See what you would weigh on a different world with accurate gravity comparisons.',
  ),
];
