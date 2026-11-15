import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:space_app/features/Space%20Metrics/presenter/screens/space_metrics.dart';
import 'package:space_app/features/splashscreen/presenter/screens/splash_screen.dart';

Future<void> main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  scrollBehavior: const MaterialScrollBehavior().copyWith(
    dragDevices: {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
      PointerDeviceKind.trackpad,
      PointerDeviceKind.stylus,
    },
  ),
      initialRoute: SplashScreen.splashRoute,
      routes: {SplashScreen.splashRoute: (context) => 
      SpaceMetrics()
      // SplashScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
