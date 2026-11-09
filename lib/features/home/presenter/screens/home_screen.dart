import 'package:flutter/material.dart';
import 'package:space_app/core/components/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const homeRoute = "/home";
  @override
  Widget build(BuildContext context) {
    return Background(child: Placeholder());
  }
}