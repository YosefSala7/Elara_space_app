import 'package:flutter/material.dart';
import 'package:space_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:space_app/features/onboarding/presenter/widgets/onboarding_art.dart';

class OnboardingRocket extends StatefulWidget {
  final OnboardingModel model;
  final bool visible;
  const OnboardingRocket({
    super.key,
    required this.model,
    required this.visible,
  });

  @override
  State<OnboardingRocket> createState() => _OnboardingRocketState();
}

class _OnboardingRocketState extends State<OnboardingRocket>
    with SingleTickerProviderStateMixin {
  late final AnimationController slide = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    if (widget.visible) _enter();
  }

  @override
  void didUpdateWidget(OnboardingRocket oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.visible != widget.visible) {
      widget.visible ? _enter() : _exit();
    }
  }

  void _enter() {
    slide.value = 0;
    slide.animateTo(
      0.5,
      duration: Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
    );
  }

  void _exit() {
    slide.animateTo(
      1,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInCubic,
    );
  }

  @override
  void dispose() {
    slide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final travel = width * (1 + widget.model.scale);

    return AnimatedBuilder(
      animation: slide,
      child: OnboardingArt(model: widget.model),
      builder: (context, child) => Transform.translate(
        offset: Offset((slide.value - 0.5) * travel, 0),
        child: child,
      ),
    );
  }
}
