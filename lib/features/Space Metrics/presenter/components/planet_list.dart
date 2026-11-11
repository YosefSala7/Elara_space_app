import 'package:flutter/material.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';

import 'package:space_app/features/Space%20Metrics/data/models/planet_model.dart';

class PlanetList extends StatefulWidget {
  const PlanetList({super.key});

  @override
  State<PlanetList> createState() => _PlanetListState();
}

class _PlanetListState extends State<PlanetList> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        scrollDirection: Axis.horizontal,
        itemCount: planets.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = isSelected ? null : index;
              });
            },
            child: AnimatedScale(
              scale: isSelected ? 1.08 : 1.0,
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeOutCubic,
              child: LiquidGlassLayer(
                settings: LiquidGlassSettings.ios27RegularDark(),
                child: LiquidGlass(
                  shape: LiquidRoundedSuperellipse(borderRadius: 20),
                  child: Container(
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: isSelected
                          ? Border.all(
                              color: AppColors.primary.withValues(alpha: .6),
                              width: 1.5,
                            )
                          : null,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 110, child: planets[index].image),
                        const SizedBox(height: 8),
                        Text(
                          planets[index].name,
                          style: TextStyle(
                            color: AppColors.white,
                            fontFamily: FontFamily.spaceGrotesk,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
