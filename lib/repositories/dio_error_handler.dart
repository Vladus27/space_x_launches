import 'package:dio/dio.dart';
import 'package:space_x_launches/repositories/api_error.dart';

class DioErrorHandler {
  static ApiError handle(DioException e) {
    final statusCode = e.response?.statusCode;

    if (statusCode == 404) {
      return ApiError(message: 'Not found', statusCode: statusCode);
    }
    if (statusCode == 429) {
      return ApiError(message: 'Too Many Requests', statusCode: statusCode);
    }

    return ApiError(message: 'Server error occurred', statusCode: statusCode);
  }
}
