import 'package:flutter/material.dart';
import 'package:space_x_launches/features/home/home.dart';
import 'package:space_x_launches/theme/theme.dart';

class SpaceXLaunchApp extends StatelessWidget {
  const SpaceXLaunchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX Launches',
      theme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
