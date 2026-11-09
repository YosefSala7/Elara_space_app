import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/Space%20Metrics/presenter/screens/space_metrics.dart';
import 'package:space_app/features/splashscreen/presenter/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SplashScreen.splashRoute,
      routes: {SplashScreen.splashRoute: (context) => 
      SpaceMetrics()
      // SplashScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
