import 'package:blueray_test_project/modules/authentication/service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static late String authToken;
  static String apiBaseUrl = dotenv.get('API_URL', fallback: '');
  static String apiAccessToken = dotenv.get('ACCESS_TOKEN', fallback: '');
  Future<void> loadEnvironmentVariables() async {
    await dotenv.load(fileName: ".env");
  }

  static Future<void> initialize() async {
    authToken = await AuthService().getAuthToken() ?? '';
  }
}
