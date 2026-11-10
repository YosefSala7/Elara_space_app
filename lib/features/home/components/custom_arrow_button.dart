import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class CustomArrowButton extends StatelessWidget {
  CustomArrowButton({super.key, required this.onTap, required this.direction});
  Function onTap;

  String direction;
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      duration: Duration(milliseconds: 70),
      scaleFactor: 0.6,
      onTap: () {
        onTap();
      },
      child:
          LiquidGlassLayer(
        settings: LiquidGlassSettings.ios27Clear(),
        child: LiquidGlass(
          shape: LiquidRoundedSuperellipse(borderRadius: 50),
          child: Container(
            padding: EdgeInsets.all(12),
            child: direction == "left"
                ? Assets.icons.arrowLeft.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  )
                : Assets.icons.arrowRight.svg(
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
