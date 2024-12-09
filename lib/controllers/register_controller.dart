// controllers/providers/login_provider.dart
import 'package:blueray_test_project/modules/register/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterState {
  final String userId;
  final String password;
  final String registrationCode;
  final bool isLoading;
  final String? error;

  RegisterState({
    this.userId = '',
    this.password = '',
    this.registrationCode = '',
    this.isLoading = false,
    this.error,
  });

  RegisterState copyWith({
    String? userId,
    String? password,
    String? registrationCode,
    bool? isLoading,
    String? error,
  }) {
    return RegisterState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      registrationCode: registrationCode ?? this.registrationCode,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState());

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

  Future<String> registerMini() async {
    print("Starting registration");
    state = state.copyWith(
      isLoading: true,
    );

    try {
      String success = await RegisterService().registerMini(state.userId);
      print("Success: $success");

      if (success.toLowerCase().replaceAll(RegExp(r'\s+'), '') ==
          'newuserregistrationissuccessful') {
        state = state.copyWith(
          isLoading: false,
        );
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

  Future<String> registerVerify() async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      String success = await RegisterService()
          .registerVerify(state.userId, state.registrationCode);

      if (success != 'Register code is not valid!') {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
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

  Future<String> resendCode() async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      String success = await RegisterService().resendCode(state.userId);

      if (success.contains('Resend registration code is success')) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
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

  Future<String> registerPassword() async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      String success = await RegisterService()
          .registerMandatory(state.userId, state.password);

      if (success == 'Customer successfully registered') {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
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

final registerProvider =
    StateNotifierProvider<RegisterController, RegisterState>((ref) {
  return RegisterController();
});
