import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:glass/glass.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/assets.gen.dart';

class CustomArrowButton extends StatelessWidget {
  CustomArrowButton({super.key, required this.onTap, required this.direction});
  Function onTap;

  String direction;
  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        onTap();
      },
      child:
          Container(
            padding: EdgeInsets.all(12),

            decoration: ShapeDecoration(shape: CircleBorder()),
            child: direction == "left"
                ? Assets.icons.arrowLeft.svg(colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn))
                : Assets.icons.arrowRight.svg(colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
          ).asGlass(
            clipBorderRadius: BorderRadius.circular(50),
            frosted: true,
            blurX: 20,
            blurY: 20,
            
          ),
    );
  }
}
