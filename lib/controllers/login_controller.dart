// controllers/providers/login_provider.dart
import 'package:blueray_test_project/modules/authentication/service.dart';
import 'package:blueray_test_project/modules/register/service.dart';
import 'package:blueray_test_project/pages/initial/initial_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final String userId;
  final String password;
  final String registrationCode;
  final bool isLoading;
  final String? error;

  LoginState({
    this.userId = '',
    this.password = '',
    this.registrationCode = '',
    this.isLoading = false,
    this.error,
  });

  LoginState copyWith({
    String? userId,
    String? password,
    String? registrationCode,
    bool? isLoading,
    String? error,
  }) {
    return LoginState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      registrationCode: registrationCode ?? this.registrationCode,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class LoginController extends StateNotifier<LoginState> {
  LoginController() : super(LoginState());

  void setUserId(String value) {
    state = state.copyWith(userId: value);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setRegistrationCode(String value) {
    state = state.copyWith(registrationCode: value);
  }

  Future<String> login() async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      String success = await AuthService().login(state.userId, state.password);

      if (success == 'null') {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        final expiry = await AuthService().getTestAuthTokenExpiryDate();
        AuthTimerService().startTimer(DateTime.parse(expiry.toString()));
        return '';
      } else {
        print("Registration failed: $success");
        state = state.copyWith(
          isLoading: false,
        );
        return success;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      state = state.copyWith(
        isLoading: false,
      );
      return e.toString();
    }
  }
}

final loginProvider = StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController();
});
