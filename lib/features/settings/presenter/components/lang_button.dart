import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';

class LangButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  const LangButton({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LiquidGlassLayer(
      settings: LiquidGlassSettings.ios27RegularDark(),
      child: LiquidGlass(
        shape: LiquidRoundedSuperellipse(borderRadius: 20),
        child: Bounceable(
          onTap: onTap,
          child: Container(
            padding: .symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: isSelected ? AppColors.primary : Colors.transparent,
                width: 1,
              ),
              color:
                  Colors.black.withValues(alpha: 0.37),
                  
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.white,
                fontFamily: "SpaceGrotesk",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
