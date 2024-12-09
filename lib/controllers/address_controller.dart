import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
import 'package:blueray_test_project/modules/customer_address/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressState {
  final String userId;
  final String password;
  final String registrationCode;
  final bool isLoading;
  final String? error;

  AddressState({
    this.userId = '',
    this.password = '',
    this.registrationCode = '',
    this.isLoading = false,
    this.error,
  });

  AddressState copyWith({
    String? userId,
    String? password,
    String? registrationCode,
    bool? isLoading,
    String? error,
  }) {
    return AddressState(
      userId: userId ?? this.userId,
      password: password ?? this.password,
      registrationCode: registrationCode ?? this.registrationCode,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class LoginController extends StateNotifier<AddressState> {
  LoginController() : super(AddressState());

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
}

final customerAddressProvider =
    FutureProvider.autoDispose<List<Address>>((ref) async {
  return await CustomerAddressService().getCustomerAddresses();
});
