import 'package:flutter/material.dart';
import 'package:space_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/Space%20Metrics/manager/metrics_cubit.dart';
import 'package:space_app/features/Space%20Metrics/manager/metrics_states.dart';
import 'package:space_app/features/Space%20Metrics/presenter/components/custom_text_field.dart';
import 'package:space_app/features/Space%20Metrics/presenter/components/share_card.dart';
import 'package:space_app/features/Space%20Metrics/presenter/screens/planet_list.dart';

class SpaceMetrics extends StatefulWidget {
  const SpaceMetrics({super.key});

  @override
  State<SpaceMetrics> createState() => _SpaceMetricsState();
}

class _SpaceMetricsState extends State<SpaceMetrics> {
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  final spaceWeightController = TextEditingController();
  final spaceAgeController = TextEditingController();

  @override
  void dispose() {
    weightController.dispose();
    ageController.dispose();
    spaceWeightController.dispose();
    spaceAgeController.dispose();
    super.dispose();
  }

  void calculate(BuildContext context) {
    final weight = double.tryParse(weightController.text);
    final age = double.tryParse(ageController.text);

    if (weight == null || age == null || weight <= 0 || age <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.tr('Please enter a valid weight and age'))),
      );
      return;
    }

    if (context.read<MetricsCubit>().selectedPlanet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.tr('Please select a planet first'))),
      );
      return;
    }

    context.read<MetricsCubit>().calculateMetrics(
      earthWeight: weight,
      earthAge: age,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MetricsCubit(),
      child: Builder(
        builder: (context) {
          return BlocListener<MetricsCubit, MetricsState>(
            listener: (context, state) {
              if (state is MetricsSuccess) {
                spaceWeightController.text = state.weight.toStringAsFixed(2);

                spaceAgeController.text = state.age.toStringAsFixed(2);
              }

              if (state is MetricsInitial) {
                spaceWeightController.clear();
                spaceAgeController.clear();
              }
            },
            child: Background(
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 30,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Center(
                        child: Text(
                          context.tr("Space Metrics"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontFamily: FontFamily.audiowide,
                          ),
                        ),
                      ),

                      // Normal Information
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          context.tr("Your Normal information :"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontFamily: FontFamily.audiowide,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              text: "Weight",
                              controller: weightController,
                              img: Assets.icons.iconsaxWeight.svg(width: 20),
                            ),

                            CustomTextField(
                              text: "Age",
                              controller: ageController,
                              img: Assets.icons.fiRrCalendar.svg(
                                color: AppColors.white,
                                width: 17,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Planets
                      PlanetList(),

                      // Space Information
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          context.tr("Your Information in Space:"),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.white,
                            fontFamily: FontFamily.audiowide,
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextField(
                              text: "Weight",
                              controller: spaceWeightController,
                              readOnly: true,
                              img: Assets.icons.iconsaxWeight.svg(width: 20),
                            ),

                            CustomTextField(
                              text: "Age",
                              controller: spaceAgeController,
                              readOnly: true,
                              img: Assets.icons.fiRrCalendar.svg(
                                color: AppColors.white,
                                width: 17,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Calculate Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          spacing: 20,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(180, 50),
                                  backgroundColor: AppColors.primary,
                                ),
                                onPressed: () {
                                  calculate(context);
                                },
                                child: Text(
                                  context.tr("Calculate"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: AppColors.white,
                                    fontFamily: FontFamily.audiowide,
                                  ),
                                ),
                              ),
                            ),

                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(180, 50),
                                  backgroundColor: AppColors.primary,
                                ),
                                onPressed: () {
                                  final cubit = context.read<MetricsCubit>();

                                  final state = cubit.state;
                                  final planet = cubit.selectedPlanet;

                                  if (state is! MetricsSuccess ||
                                      planet == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          context.tr('Calculate your metrics first'),
                                        ),
                                      ),
                                    );
                                    return;
                                  }

                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return ShareCard(
                                        planetName: planet.name,
                                        planetImage: planet.image,
                                        weight: state.weight.toStringAsFixed(2),
                                        age: state.age.toStringAsFixed(2),
                                        jumpMultiplier:
                                            context.trf('Jump {x}×', {
                                              'x': (1 / planet.gravity).toStringAsFixed(1),
                                            }),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  context.tr("Share"),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: AppColors.white,
                                    fontFamily: FontFamily.audiowide,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Share Button
                    ],
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
