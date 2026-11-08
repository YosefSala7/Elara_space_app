import 'package:flutter/material.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class Background extends StatelessWidget {
  Background({super.key,required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Assets.lotties.fallingStarsBackground.lottie(fit: .cover,repeat: true,),
          ),
          child
        ],
      ),
    );
  }
}
