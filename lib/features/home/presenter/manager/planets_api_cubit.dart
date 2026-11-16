import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';
import 'package:space_app/features/home/data/repos/get_planets_service.dart';
import 'package:space_app/features/home/presenter/manager/planets_api_states.dart';

class PlanetsApiCubit extends Cubit<PlanetsState> {
  PlanetsApiCubit() : super(PlanetsState());
  Future<void> getPlanets() async {
    emit(PlanetsState(isLoading: true));
    final result = await getPlanetsApi();
    result.fold(
      (error) {
        emit(PlanetsState(error: error,isLoading: false));
      },
      (planets) {
        emit(PlanetsState(planets: planets,isLoading: false));
      },
    );
  }
}
