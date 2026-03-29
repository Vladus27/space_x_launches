import 'package:dio/dio.dart';
import 'package:space_x_launches/repositories/api_error.dart';
import 'package:space_x_launches/repositories/dio_error_handler.dart';
import 'package:space_x_launches/repositories/environment.dart';
import 'package:space_x_launches/repositories/rocket_launches/model/rocket_launch.dart';

class RocketLaunchesRepository {
  final Dio _dio = Dio();
  final _basicUrl = Environment.apiUrl;

  Future<Result<List<RocketLaunch>>> getRocketLaunches(String rocketId) async {
    try {
      final response = await _dio.get(
        '$_basicUrl/launches',
        queryParameters: {"rocket_id": rocketId},
      );
      final responseData = response.data as List;

      final List<RocketLaunch> launchList = responseData.map<RocketLaunch>((e) {
        return RocketLaunch.fromJson(e as Map<String, dynamic>);
      }).toList();

      return Result.success(launchList);
    } on DioException catch (e) {
      return Result.failure(DioErrorHandler.handle(e));
    }
  }
}
