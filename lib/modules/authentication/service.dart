import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final prefs = const FlutterSecureStorage();
  String apiPrefix = '${AppConfig.apiBaseUrl}/customer';
  String apiToken = '${AppConfig.apiAccessToken}';
  final dio = DioClient().dio;
  final dio2 = DioClient2().dio;

  Future<String> login(String userId, String password) async {
    final String url = (apiPrefix + '/login');
    final Map<String, String> body = {'user_id': userId, 'password': password};
    print(body);

    try {
      final response = await dio.post(url, data: body);
      print(response);
      print(response.data['login']);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {

        if (response.data['login'] == true) {
          await prefs.write(key: 'token', value: response.data['token']);
          await prefs.write(
              key: 'token_expiry_date',
              value: response.data[
                  'token_expiry_date']); //TODO make functions to get these
          await AppConfig.initialize();
          return response.data['message'].toString();
        } else {
          if (response.data['message'].isNotEmpty) {
            throw response.data['message'];
          } else {
            throw 'User login failed, please enter valid credentials.';
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

  Future<String> logout() async {
    final String url = (apiPrefix + '/logout');

    try {
      final response = await dio2.post(
        url,
      );
      print(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data['login'] == true) {
          clearAll(); //TODO make functions to get these

          return '';
        } else {
          return '';
        }
      } else {
        throw 'Invalid Credentials';
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<String?> getAuthToken() async {
    return await prefs.read(key: 'token');
  }

  Future clearAll() async {
    return await prefs.deleteAll();
  }

  Future<String?> getAuthTokenExpiryDate() async {
    return await prefs.read(key: 'token_expiry_date');
  }

  Future<String?> getTestAuthTokenExpiryDate() async {
    final now = DateTime.now().toUtc();
    final expiryDate = now.add(Duration(seconds: 40));

    return expiryDate.toIso8601String();
  }

  Future<void> clearAuthTokenExpiryDate() async {
    return await prefs.delete(key: 'token_expiry_date');
  }
}
