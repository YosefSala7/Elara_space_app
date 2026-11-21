import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_app/core/app_colors.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/core/gen/assets.gen.dart';
import 'package:space_app/core/gen/fonts.gen.dart';
import 'package:space_app/features/home/components/custom_arrow_button.dart';
import 'package:space_app/features/home/data/models/planet_model.dart';
import 'package:space_app/features/planet%20info/components/about.dart';
import 'package:space_app/features/planet%20info/components/stats_section.dart';

class PlanetInfo extends StatelessWidget {
  PlanetInfo({super.key, required this.planet});
  PlanetModel planet;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Background(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 20,
              children: [
                InfoAppBar(name: planet.name),
                SizedBox(
                  height: 500,
                  width: 500,
                  child: ModelViewer(
                    disablePan: true,
                    autoPlay: true,
                    autoRotate: true,
                    cameraControls: false,
                    src:
                        "https://tuhhvfjgyiliqfvnyuli.supabase.co/storage/v1/object/sign/planets_3Dmodels/earth.glb?token=eyJraWQiOiIyNTc2NDJiOS01YjE4LTRjNjQtYWE3MS1mMDE5ODg3ZjQzYjkiLCJhbGciOiJFUzI1NiJ9.eyJ1cmwiOiJwbGFuZXRzXzNEbW9kZWxzL2VhcnRoLmdsYiIsInNjb3BlIjoiZG93bmxvYWQiLCJpYXQiOjE3OTUyMDIzOTIsImV4cCI6MTgyNjczODM5Mn0.80JmrrO4tE-5ler38FJ_ypLu3HEABlFgyDSqz-G07kOIqpVv0RUid4RO327ZOAWrUiF_oAPz-LkMCj3Xp30Rcg",
                  ),
                ),
                AboutSection(about: planet.about),
                StatsSection(planet: planet),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoAppBar extends StatelessWidget {
  InfoAppBar({super.key, required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 100,
      mainAxisAlignment: .start,
      children: [
        CustomArrowButton(
          onTap: () {
            Navigator.pop(context);
          },
          direction: "left",
        ),

        Text(
          name,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontFamily: FontFamily.audiowide,
            fontWeight: .w700,
          ),
        ),
      ],
    );
  }
}
