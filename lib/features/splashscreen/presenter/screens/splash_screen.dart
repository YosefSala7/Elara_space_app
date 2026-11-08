import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/components/branding.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String splashRoute = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 7), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Scaffold(body: Placeholder())),
      );
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Assets.lotties.rocketLoader.lottie(width: 200),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: _animation,
                child: Text(
                  "ELARA",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontFamily: FontFamily.audiowide,
                  ),
                ),
              ),
        Spacer(),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Branding(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
