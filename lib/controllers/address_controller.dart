import 'dart:io';

import 'package:blueray_test_project/modules/address/models/district.dart';
import 'package:blueray_test_project/modules/address/models/province.dart';
import 'package:blueray_test_project/modules/address/models/search_address.dart';
import 'package:blueray_test_project/modules/address/models/sub_district.dart';
import 'package:blueray_test_project/modules/address/services.dart';
import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
import 'package:blueray_test_project/modules/customer_address/models/create_address.dart';
import 'package:blueray_test_project/modules/customer_address/services.dart';
import 'package:blueray_test_project/modules/upload/service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressState {
  final String postCode;
  final String password;
  final String registrationCode;
  final String provinceId;
  final String districtId;
  final bool isLoading;
  final bool isValid;
  final String? error;

  AddressState({
    this.postCode = '',
    this.password = '',
    this.registrationCode = '',
    this.districtId = '',
    this.provinceId = '',
    this.isLoading = false,
    this.isValid = false,
    this.error,
  });

  AddressState copyWith({
    String? postCode,
    String? password,
    String? registrationCode,
    String? provinceId,
    String? districtId,
    bool? isValid,
    bool? isLoading,
    String? error,
  }) {
    return AddressState(
      isValid: isValid ?? this.isValid,
      provinceId: provinceId ?? this.provinceId,
      districtId: districtId ?? this.districtId,
      postCode: postCode ?? this.postCode,
      password: password ?? this.password,
      registrationCode: registrationCode ?? this.registrationCode,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}

class AddressController extends StateNotifier<AddressState> {
  AddressController() : super(AddressState());

  void setPostCode(String value) {
    state = state.copyWith(postCode: value);
  }

  void clearError() {
    state = state.copyWith(error: null);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value);
  }

  void setProvince(String value) {
    state = state.copyWith(provinceId: value);
  }

  void setDistrictId(String value) {
    state = state.copyWith(districtId: value);
  }

  Future<bool> validatePostCode() async {
    state = state.copyWith(
      isLoading: true,
      isValid: false,
    );
    try {
      bool success = await AddressService().validatePostCode(state.postCode);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
          isValid: true,
        );
        print("Registration successful!");
        return success;
      } else {
        print("Registration failed: $success");
        state = state.copyWith(
          isLoading: false,
          isValid: false,
        );
        return success;
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      state = state.copyWith(
        isLoading: false,
        isValid: false,
      );
      return false;
    }
  }

  Future<List<SearchAddress>> searchAddress(String query) async {
    state = state.copyWith(
      isLoading: true,
      isValid: false,
    );
    try {
      List<SearchAddress> success = await AddressService().searchAddress(query);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        return success;
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
      return [];
    }
  }

  Future<bool> deleteAddress(int query, WidgetRef ref) async {
    state = state.copyWith(
      isLoading: true,
      isValid: false,
    );
    try {
      bool success = await CustomerAddressService().deleteAddress(query);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        ref.refresh(customerAddressProvider);
               ref.refresh(customerAddressProvider2);
        return success;
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
      return false;
    }
  }

  Future<bool> setAsPrimary(int query, WidgetRef ref) async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      bool success = await CustomerAddressService().setAsPrimary(query);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        ref.refresh(customerAddressProvider);
        ref.refresh(customerAddressProvider2);
        return success;
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
      return false;
    }
  }

  Future<bool> createAddress(CreateAddress createAddress, WidgetRef ref) async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      bool success =
          await CustomerAddressService().createAddress(createAddress);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        ref.refresh(customerAddressProvider);
        ref.refresh(customerAddressProvider2);
        return success;
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
      return false;
    }
  }

  Future<bool> editAddress(
      CreateAddress createAddress, int addressId, WidgetRef ref) async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      bool success =
          await CustomerAddressService().editAddress(createAddress, addressId);

      if (success == true) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        ref.refresh(customerAddressProvider);
        ref.refresh(customerAddressProvider2);
        return success;
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
      return false;
    }
  }

  Future<String> createImage(File image, WidgetRef ref) async {
    state = state.copyWith(
      isLoading: true,
    );
    try {
      String success = await UploadService().uploadImage(image);

      if (success.isNotEmpty) {
        state = state.copyWith(
          isLoading: false,
        );
        print("Registration successful!");
        ref.refresh(customerAddressProvider);
        ref.refresh(customerAddressProvider2);
        return success;
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
      return '';
    }
  }
}

final addressProvider =
    StateNotifierProvider<AddressController, AddressState>((ref) {
  return AddressController();
});

final customerAddressProvider =
    FutureProvider.autoDispose<List<Address>>((ref) async {
  return await CustomerAddressService().getCustomerAddresses();
});

final customerAddressProvider2 =
    FutureProvider.autoDispose<Address>((ref) async {
  return await CustomerAddressService().getCustomerAddressPrimary();
});

final getAddressProvider =
    FutureProvider.autoDispose<List<Province>>((ref) async {
  return await AddressService().getProvinces();
});
final getAddressProvider2 =
    FutureProvider.autoDispose<List<District>>((ref) async {
  return await AddressService().getDistricts();
});
final getAddressProvider3 =
    FutureProvider.autoDispose<List<SubDistrict>>((ref) async {
  return await AddressService().getSubDistricts();
});
