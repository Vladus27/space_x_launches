import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:space_x_launches/features/home/widgets/home_content.dart';
import 'package:space_x_launches/providers/rocket_provider.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRockets = ref.watch(rocketsProvider);
    List<Rocket> rocketsList;

    return SafeArea(
      child: Scaffold(
        body: asyncRockets.when(
          data: (result) {
            if (!result.isSuccess) {
              return Center(child: Text(result.error!.message));
            }
            rocketsList = result.data!;
            return HomeContent(rocketsList: rocketsList);
          },
          error: (e, _) {
            return Center(child: Text(e.toString()));
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
