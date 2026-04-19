import 'dart:io';
import 'package:cairo_clinics_finder/core/network/app_key.dart';
import 'package:dio/dio.dart';

class CloudinaryService {
  static final _dio = Dio();

  static Future<String?> uploadImage(File image) async {
    try {
      final formData = FormData.fromMap({
        'upload_preset': AppKey.uploadPreset,
        'file': await MultipartFile.fromFile(image.path),
      });
      final response = await _dio.post(AppKey.baseUrl, data: formData);
      return response.data['secure_url'] as String?;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          return "Connection timeout";
        case DioExceptionType.sendTimeout:
          return "Send timeout";
        case DioExceptionType.receiveTimeout:
          return "Receive timeout";
        case DioExceptionType.badCertificate:
          return "Bad certificate";
        case DioExceptionType.badResponse:
          return "Bad response";
        case DioExceptionType.cancel:
          return "Canceled";
        case DioExceptionType.connectionError:
          return "Connection error";
        case DioExceptionType.unknown:
          return "Unknown error";
      }
    }
  }
}
