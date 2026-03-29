import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:space_x_launches/features/home/widgets/home_card.dart';
import 'package:space_x_launches/features/home/widgets/home_carousel_slider.dart';
import 'package:space_x_launches/features/home/widgets/home_indicator_dots.dart';
import 'package:space_x_launches/providers/rocket_provider.dart';
import 'package:space_x_launches/providers/slider_index_provider.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class HomeContent extends ConsumerWidget {
  const HomeContent({super.key, required this.rocketsList});
  final List<Rocket> rocketsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);

    final sliderIndex = ref.watch(sliderIndexProvider);
    final rocketId = rocketsList[sliderIndex].rocketId;
    final asyncLaunches = ref.watch(rocketLaunchesProvider(rocketId));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'SpaceX Launches',
              style: themeData.textTheme.titleLarge,
            ),
          ),
        ),
        HomeCarouselSlider(rocketsList: rocketsList),
        const SizedBox(height: 12),
        HomeIndicatorDots(rocketsList: rocketsList),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Missions', style: themeData.textTheme.titleLarge),
        ),

        asyncLaunches.when(
          data: (result) {
            if (!result.isSuccess) {
              return Expanded(
                child: Center(child: Text(result.error!.message)),
              );
            }
            final rocketLaunchList = result.data!;
            if (rocketLaunchList.isEmpty) {
              return const Expanded(
                child: Center(child: Text('The list of missions is empty')),
              );
            }
            return Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: rocketLaunchList.length,
                itemBuilder: (context, index) {
                  return HomeCard(rocketLaunch: rocketLaunchList[index]);
                },
              ),
            );
          },
          error: (e, _) {
            return Center(child: Text(e.toString()));
          },
          loading: () =>
              const Expanded(child: Center(child: CircularProgressIndicator())),
        ),
      ],
    );
  }
}
