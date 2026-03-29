import 'package:dio/dio.dart';

import 'package:space_x_launches/repositories/environment.dart';
import 'package:space_x_launches/repositories/space_rocket/model/rocket.dart';

class RocketRepository {
  final Dio _dio = Dio();
  final String _basicUrl = Environment.apiUrl;
  Future<List<Rocket>> getRockets() async {
    try {
      final response = await _dio.get('$_basicUrl/rockets');
      final responseData = response.data as List;

      final rocketList = responseData
          .map<Rocket>((e) => Rocket.fromJson(e as Map<String, dynamic>))
          .toList();

      return rocketList;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return [];
      }
      return [];
    }
  }
}
