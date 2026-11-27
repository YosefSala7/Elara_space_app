import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/features/onboarding/presenter/widgets/page_indictor.dart';
import 'package:space_app/l10n/app_localizations.dart';

class OnboardingController extends StatelessWidget {
  final int currentPage;
  final int pageIndex;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onSkip;

  const OnboardingController({
    super.key,
    required this.currentPage,
    required this.pageIndex,
    required this.pageController,
    required this.onNext,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onSkip,
                child: Text(
                  context.tr('Skip'),
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PageIndictor(
                  pageController: pageController,
                  pageIndex: pageIndex,
                ),
                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    fixedSize: const Size(140, 40),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.tr(
                          currentPage == pageIndex - 1 ? 'Get Started' : 'Next',
                        ),
                        style: const TextStyle(fontSize: 12),
                      ),
                      const SizedBox(width: 6),
                      const Icon(Icons.arrow_forward, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
