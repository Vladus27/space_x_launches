import 'package:flutter_riverpod/flutter_riverpod.dart';

class SliderIndexNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void setIndex(int index) {
    state = index;
  }
}

final sliderIndexProvider = NotifierProvider<SliderIndexNotifier, int>(
  SliderIndexNotifier.new,
);
