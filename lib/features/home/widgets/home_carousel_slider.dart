import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:space_x_launches/providers/slider_index_provider.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class HomeCarouselSlider extends ConsumerWidget {
  const HomeCarouselSlider({super.key, required this.rocketsList});
  final List<Rocket> rocketsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderIndexNotifier = ref.read(sliderIndexProvider.notifier);

    return CarouselSlider.builder(
      itemCount: rocketsList.length,
      itemBuilder: (context, index, currentIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(10),
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                rocketsList[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        height: 194,
        viewportFraction: 0.78,
        enlargeFactor: 0.18,
        onPageChanged: (index, reason) {
          sliderIndexNotifier.setIndex(index);
        },
      ),
    );
  }
}
