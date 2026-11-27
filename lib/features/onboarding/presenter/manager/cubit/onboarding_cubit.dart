import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/onboarding/data/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int index) {
    emit(index);
  }

  void next() {
    if (state < onboardingScreens.length - 1) {
      emit(state + 1);
    }
  }

  void skip() {
    emit(onboardingScreens.length - 1);
  }
}
