import 'dart:convert';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
import 'package:blueray_test_project/modules/customer_address/models/create_address.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomerAddressService {
  final prefs = const FlutterSecureStorage();
  String apiPrefix = '${AppConfig.apiBaseUrl}/customer';
  String apiToken = '${AppConfig.authToken}';
  final dio = DioClient2().dio;

  Future<List<Address>> getCustomerAddresses() async {
    final String url = (apiPrefix + '/address');
    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonData = response.data;
        final addresses = jsonData
            .map((addressData) =>
                Address.fromJson(addressData as Map<String, dynamic>))
            .toList();

        return addresses;
      } else {
        throw 'Failed to fetch addresses. Status code: ${response.statusCode}';
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<Address> getCustomerAddressPrimary() async {
    final String url = (apiPrefix + '/address/primary');
    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final addresses = Address.fromJson(response.data['result']);

        return addresses;
      } else {
        throw 'Failed to fetch addresses. Status code: ${response.statusCode}';
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<bool> deleteAddress(int addressId) async {
    final String url = (apiPrefix + '/address/delete');
    try {
      final response = await dio.delete(url, data: {'address_id': addressId});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['action'];
      } else {
        return response.data['action'];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<bool> setAsPrimary(int addressId) async {
    final String url = (apiPrefix + '/address/primary');
    try {
      final response = await dio.post(url, data: {'address_id': addressId});

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['action'];
      } else {
        return response.data['action'];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<bool> createAddress(CreateAddress address) async {
    final String url = (apiPrefix + '/address');
    try {
      final response = await dio.post(url, data: address.toJson());
      print(address.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['action'];
      } else {
        return response.data['action'];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<bool> editAddress(CreateAddress address, int addressId) async {
    final String url = (apiPrefix + '/address/$addressId');
    try {
      final response = await dio.put(url, data: address.toJson());
      print(address.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['action'];
      } else {
        return response.data['action'];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }
}
