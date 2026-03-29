import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:space_x_launches/providers/slider_index_provider.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class HomeIndicatorDots extends ConsumerWidget {
  const HomeIndicatorDots({super.key, required this.rocketsList});
  final List<Rocket> rocketsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderState = ref.watch(sliderIndexProvider);
    bool isActive;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(rocketsList.length, (index) {
        isActive = sliderState == index ? true : false;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            color: isActive ? Colors.white : Colors.transparent,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }
}
