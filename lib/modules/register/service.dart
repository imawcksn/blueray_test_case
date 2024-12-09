import 'dart:async';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterService {
  final prefs = const FlutterSecureStorage();
  String apiPrefix = '${AppConfig.apiBaseUrl}/customer/register';
  String apiToken = '${AppConfig.apiAccessToken}';
  final dio = DioClient().dio;

  Future<String> registerMini(String userId) async {
    final String url = (apiPrefix + '/mini');
    final Map<String, String> body = {'user_id': userId};
    print(body);

    try {
      final response = await dio.post(url, data: body);
      print(response);
      print(response.data['action']);
      print(response.statusCode);

      // Check for successful response with status 200 or 201
      if (response.statusCode == 200 || response.statusCode == 201) {
        // If action is true, return the success message, else return failure message.
        if (response.data['action'] == true) {
          return response.data['message'];
        } else {
          if (response.data['message'].isNotEmpty) {
            throw response.data['message'];
          } else {
            throw 'New user registration failed, please enter valid credentials.';
          }
        }
      } else {
        throw 'Invalid Credentials';
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<String> registerVerify(String userId, String code) async {
    final String url = (apiPrefix + '/verify-code');
    final Map<String, String> body = {'user_id': userId, 'code': code};
    print(body);
    try {
      final response = await dio.post(url, data: body);
      if (response.statusCode == 200 && response.data['action'] != false) {
        return response.data['message'];
      } else {
        throw response.data['message'] ?? 'Invalid Code';
      }
    } catch (e) {
      throw Exception('Request failed: ${e.toString()}');
    }
  }

  Future<String> resendCode(String userId) async {
    final String url = (apiPrefix + '/resend-code');
    final Map<String, String> body = {
      'user_id': userId,
    };
    print(body);
    try {
      final response = await dio.post(url, data: body);
      if (response.statusCode == 200 && response.data['action'] != false) {
        return response.data['message'];
      } else {
        throw response.data['message'] ?? 'Invalid Credentials';
      }
    } catch (e) {
      throw Exception('Request failed: ${e.toString()}');
    }
  }

  Future<String> registerMandatory(String userId, String password,
      {String? firstName,
      String? lastName,
      String? idCardNumber,
      String? idCardImage,
      String? idCardAddress,
      String? idCardName}) async {
    final String url = (apiPrefix + '/mandatory');
    final Map<String, String> body = {
      'user_id': userId,
      'password': password,
    };
    if (firstName != null) body['first_name'] = firstName;
    if (lastName != null) body['last_name'] = lastName;
    if (idCardNumber != null) body['id_card_number'] = idCardNumber;
    if (idCardImage != null) body['id_card_image'] = idCardImage;
    if (idCardAddress != null) body['id_card_address'] = idCardAddress;
    if (idCardName != null) body['id_card_name'] = idCardName;
    try {
      final response = await dio.post(url, data: body);
      return response.data['message'];
    } catch (e) {
      throw Exception('Request failed: ${e.toString()}');
    }
  }
}
