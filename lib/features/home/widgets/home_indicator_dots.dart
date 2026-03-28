import 'package:flutter/material.dart';

class HomeIndicatorDots extends StatelessWidget {
  const HomeIndicatorDots({super.key});

  @override
  Widget build(BuildContext context) {
    var isActive = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        isActive = index == 2 ? true : false;
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
