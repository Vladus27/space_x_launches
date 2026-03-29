import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:space_x_launches/repositories/api_error.dart';
import 'package:space_x_launches/repositories/rocket_launches/model/rocket_launch.dart';
import 'package:space_x_launches/repositories/rocket_launches/rocket_launches_repository.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';
import 'package:space_x_launches/repositories/space_rocket/rocket_repository.dart';

final rocketRepositoryProvider = Provider<RocketRepository>((ref) {
  return RocketRepository();
});

final rocketLaunchesRepositoryProvider = Provider<RocketLaunchesRepository>((
  ref,
) {
  return RocketLaunchesRepository();
});

final rocketsProvider = FutureProvider<Result<List<Rocket>>>((ref) async {
  final repo = ref.read(rocketRepositoryProvider);
  return repo.getRockets();
});

final rocketLaunchesProvider =
    FutureProvider.family<Result<List<RocketLaunch>>, String>((ref, id) async {
      final repo = ref.read(rocketLaunchesRepositoryProvider);
      return repo.getRocketLaunches(id);
    });
