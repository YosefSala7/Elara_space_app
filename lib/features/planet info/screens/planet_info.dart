import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:space_app/core/components/background.dart';
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
                  height: 300,
                  width: 500,
                  child: ModelViewer(
                    autoPlay: true,
                    autoRotate: true,
                    cameraControls: true,
                    src: planet.model_3D,
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