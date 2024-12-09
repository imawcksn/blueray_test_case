import 'dart:io';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UploadService {
  final prefs = const FlutterSecureStorage();
  String apiPrefix = '${AppConfig.apiBaseUrl}/image';
  String apiToken = '${AppConfig.authToken}';
  final dio = DioClient2().dio;

  Future<String> uploadImage(File image) async {
    final String url = (apiPrefix + '/upload');
    try {
      // Prepare the image file as FormData
      FormData formData = FormData.fromMap({
        'image_file':
            await MultipartFile.fromFile(image.path, filename: 'image.jpg'),
      });

      final response = await dio.post(
        url,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['image_url'] ?? '';
      } else {
        return '';
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }
}
