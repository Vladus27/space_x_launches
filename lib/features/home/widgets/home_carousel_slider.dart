import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarouselSlider extends StatelessWidget {
  const HomeCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, currentIndex) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
