import 'package:dio/dio.dart';

import 'package:space_x_launches/repositories/api_error.dart';
import 'package:space_x_launches/repositories/dio_error_handler.dart';
import 'package:space_x_launches/repositories/environment.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class RocketRepository {
  final Dio _dio = Dio();
  final String _basicUrl = Environment.apiUrl;
  Future<Result<List<Rocket>>> getRockets() async {
    try {
      final response = await _dio.get('$_basicUrl/rockets');
      final responseData = response.data as List;

      final rocketList = responseData
          .map<Rocket>((e) => Rocket.fromJson(e as Map<String, dynamic>))
          .toList();

      return Result.success(rocketList);
    } on DioException catch (e) {
      return Result.failure(DioErrorHandler.handle(e));
    }
  }
}
