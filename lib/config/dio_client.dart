import 'package:blueray_test_project/config/config.dart';
import 'package:dio/dio.dart';

class DioClient {
  // Singleton instance
  static final DioClient _instance = DioClient._internal();

  // Dio instance
  final Dio dio;

  factory DioClient() {
    return _instance;
  }

  DioClient._internal() : dio = Dio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request: ${options.uri}");
          print("Request Headers: ${options.headers}");
          options.headers['AccessToken'] = '${AppConfig.apiAccessToken}';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response: ${response.statusCode}");
          print("Response Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print("Error: ${error.message}");
          print("Error Response: ${error.response}");
          return handler.next(error);
        },
      ),
    );
  }
}

class DioClient2 {
  // Singleton instance
  static final DioClient2 _instance = DioClient2._internal();

  // Dio instance
  final Dio dio;

  factory DioClient2() {
    return _instance;
  }

  DioClient2._internal() : dio = Dio() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          print("Request: ${options.uri}");
          print("Request Headers: ${options.headers}");
          options.headers['Authorization'] = 'Token ${AppConfig.authToken}';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          print("Response: ${response.statusCode}");
          print("Response Data: ${response.data}");
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          print("Error: ${error.message}");
          print("Error Response: ${error.response}");
          return handler.next(error);
        },
      ),
    );
  }
}

