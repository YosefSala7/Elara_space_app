import 'package:flutter/material.dart';
import 'package:space_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingArt extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingArt({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);

    return IgnorePointer(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(top: screen.height * model.top),
          child: SizedBox(
            width: screen.width * model.scale,
            height: screen.width * model.scale,
            child:
                model.lottie?.lottie(fit: BoxFit.contain) ??
                const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
