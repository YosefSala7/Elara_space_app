import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:space_app/features/home/presenter/manager/planets_api_cubit.dart';
import 'package:space_app/features/learn/presenter/manager/videos_cubit.dart';
import 'package:space_app/features/settings/presenter/manager/locale_cubit.dart';
import 'lang_button.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleCubit, Locale?>(
      builder: (context, locale) {
        // If the user never chose, show the language the app is really using.
        final current =
            locale?.languageCode ??
            Localizations.localeOf(context).languageCode;

        return Directionality(
          textDirection: .ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              LangButton(
                text: 'English',
                isSelected: current == 'en',
                onTap: () {
                  context.read<LocaleCubit>().setLanguage('en');
                  context.read<PlanetsApiCubit>().getPlanets('en');
                  context.read<VideosCubit>().getVideos("en");
                },
              ),
              LangButton(
                text: 'Arabic',
                isSelected: current == 'ar',
                onTap: () {
                  context.read<LocaleCubit>().setLanguage('ar');
                  context.read<PlanetsApiCubit>().getPlanets('ar');
                  context.read<VideosCubit>().getVideos("ar");
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
