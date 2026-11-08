import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static String splashRoute = "/splash";
  @override
  Widget build(BuildContext context) {
    return Background(
      child: Align(
        alignment: .center,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Assets.lotties.rocketLoader.lottie(width: 200),
            Text(
              "ELARA",
              style: TextStyle(
                fontSize: 22,
                fontWeight: .w500,
                color: Color.fromARGB(255, 255, 254, 254),
                fontFamily: FontFamily.audiowide,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
