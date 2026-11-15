abstract class MetricsState {}

class MetricsInitial extends MetricsState {}
// class MetricsPlanetSelected extends MetricsState {}


class MetricsSuccess extends MetricsState {
  final double weight;
  final double age;

  MetricsSuccess({
    required this.weight,
    required this.age,
  });
}

