import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/Space%20Metrics/data/models/planet_model.dart';
import 'package:space_app/features/Space%20Metrics/manager/metrics_states.dart';

class MetricsCubit extends Cubit<MetricsState> {
  MetricsCubit() : super(MetricsInitial());

  PlanetModel? selectedPlanet;

  void selectPlanet(PlanetModel planet) {
    selectedPlanet = planet;
    emit(MetricsInitial());
  }

  double calculateWeight(double earthWeight, PlanetModel planet) {
    return earthWeight * (planet.gravity / 9.81);
  }

  double calculateAge(double earthAge, PlanetModel planet) {
    return earthAge / planet.orbitalPeriod;
  }

  void calculateMetrics({
    required double earthWeight,
    required double earthAge,
  }) {
    if (selectedPlanet == null) return;

    final weight = calculateWeight(earthWeight, selectedPlanet!);
    final age = calculateAge(earthAge, selectedPlanet!);

    emit(MetricsSuccess(weight: weight, age: age));
  }
}
