import 'package:flutter/material.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/features/onboarding/presenter/widgets/page_indictor.dart';

class OnbordingController extends StatelessWidget {
  final int currentPage;
  final int pageIndex;
  final PageController pageController;
  final VoidCallback onNext;
  final VoidCallback onSkip;
  const OnbordingController({
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
        padding: .all(24),
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Align(
              alignment: .topRight,
              child: GestureDetector(
                onTap: onSkip,
                child: Text('Skip', style: TextStyle(color: AppColors.white)),
              ),
            ),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                PageIndictor(
                  pageController: pageController,
                  pageIndex: pageIndex,
                ),

                ElevatedButton(
                  onPressed: onNext,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF4D4D),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(110, 38),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: .min,
                    children: [
                      Text(
                        currentPage == pageIndex - 1 ? 'Get Started' : "Next",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(width: 6),
                      Icon(Icons.arrow_forward, size: 14),
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
