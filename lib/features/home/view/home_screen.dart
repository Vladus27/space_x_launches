import 'package:flutter/material.dart';

import 'package:space_x_launches/features/home/widgets/home_card.dart';
import 'package:space_x_launches/features/home/widgets/home_carousel_slider.dart';
import 'package:space_x_launches/features/home/widgets/home_indicator_dots.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(title: const Text('SpaceX Launches')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  'SpaceX Launches',
                  style: theme.textTheme.titleLarge,
                ),
              ),
            ),
            const HomeCarouselSlider(),
            const SizedBox(height: 12),
            const HomeIndicatorDots(),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Text('Missions', style: theme.textTheme.titleLarge),
            ),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 13,
                itemBuilder: (context, index) {
                  return const HomeCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
