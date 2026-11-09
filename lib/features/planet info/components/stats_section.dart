import 'package:flutter/material.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';

class StatsSection extends StatelessWidget {
  StatsSection({super.key, required this.planet});
  PlanetModel planet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: .start,
      spacing: 10,
      children: [
        Text(
          "Distance from Sun (km) : ${planet.distanceFromSun}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Length of Day (hours) : ${planet.lengthOfDay}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Orbital Period (Earth years) : ${planet.orbitalPeriod}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Radius (km) : ${planet.radius}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Mass (kg) : ${planet.mass}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Gravity (m/s²) : ${planet.gravity}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "Surface Area (km²) : ${planet.surfaceArea}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
      ],
    );
  }
}
