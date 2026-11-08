import 'package:flutter/material.dart';

import 'package:space_app/features/settings/presenter/screens/settings_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SettingsPage.settingsRoutName,
      routes: {SettingsPage.settingsRoutName: (context) => SettingsPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
