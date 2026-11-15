import 'package:flutter/material.dart';
import 'package:space_app/core/app_theme.dart';
import 'package:space_app/core/components/background.dart';
import 'package:space_app/features/home/presenter/screens/home_screen.dart';
import 'package:space_app/features/layout/layout_view.dart';
import 'package:space_app/features/splashscreen/presenter/screens/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://tuhhvfjgyiliqfvnyuli.supabase.co',
    publishableKey: 'sb_publishable_hFt3r7R3FUpGZufsmXDyvw_CCNjNr4b',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.appTheme,
      initialRoute: SplashScreen.splashRoute,
      routes: {
        SplashScreen.splashRoute: (context) => SplashScreen(),
        HomeScreen.homeRoute: (context) => HomeScreen(),
        LayoutView.layoutRoute: (context) => LayoutView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
