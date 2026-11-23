import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass/glass.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/Space%20Metrics/data/models/planet_model.dart';
import 'package:space_app/features/Space%20Metrics/manager/metrics_cubit.dart';
import 'package:space_app/features/Space%20Metrics/manager/metrics_states.dart';

class PlanetList extends StatelessWidget {
  const PlanetList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MetricsCubit, MetricsState>(
      builder: (context, state) {
        final cubit = context.read<MetricsCubit>();

        return SizedBox(
          height: 200,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            scrollDirection: Axis.horizontal,
            itemCount: planets.length,
            itemBuilder: (context, index) {
              final planet = planets[index];
              final isSelected = cubit.selectedPlanet?.name == planet.name;
              return GestureDetector(
                onTap: () {
                  cubit.selectPlanet(planet);
                },
                child: AnimatedScale(
                  scale: isSelected ? 1.08 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
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
                        SizedBox(height: 110, child: planet.image),
                        const SizedBox(height: 8),
                        Text(
                          planet.name,
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
                  ).asGlass(clipBorderRadius: BorderRadius.circular(16)),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
