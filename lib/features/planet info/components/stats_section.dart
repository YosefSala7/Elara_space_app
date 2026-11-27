import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
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
          "${context.tr('Distance from Sun (km)')} : ${planet.distanceFromSun}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Length of Day (hours)')} : ${planet.lengthOfDay}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Orbital Period (Earth years)')} : ${planet.orbitalPeriod}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Radius (km)')} : ${planet.radius}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Mass (kg)')} : ${planet.mass}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Gravity (m/s²)')} : ${planet.gravity}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
        Text(
          "${context.tr('Surface Area (km²)')} : ${planet.surfaceArea}",
          style: textTheme.titleMedium!.copyWith(fontWeight: .w700),
        ),
      ],
    );
  }
}
