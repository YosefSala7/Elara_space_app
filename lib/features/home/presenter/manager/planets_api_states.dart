import 'package:space_app/features/home/data/models/planet_model.dart';

class PlanetsState {
  List<PlanetModel> planets;
  String? error;
  bool isLoading;
  PlanetsState({this.isLoading = false, this.error, this.planets = const []});
}

// class LoadingPlanetsState extends PlanetsState {}

// class SuccessPlanetsState extends PlanetsState {
//   List<PlanetModel> list;
//   SuccessPlanetsState({required this.list});
// }

// class ErrorPlanetState extends PlanetsState {
//   String error;
//   ErrorPlanetState({required this.error});
// }
