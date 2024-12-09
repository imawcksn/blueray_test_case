import 'dart:convert';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:blueray_test_project/modules/address/models/district.dart';
import 'package:blueray_test_project/modules/address/models/province.dart';
import 'package:blueray_test_project/modules/address/models/search_address.dart';
import 'package:blueray_test_project/modules/address/models/sub_district.dart';
import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AddressService {
  final prefs = const FlutterSecureStorage();
  String apiPrefix = '${AppConfig.apiBaseUrl}/address';
  String apiToken = '${AppConfig.authToken}';
  final dio = DioClient2().dio;

  Future<bool> validatePostCode(String postCode) async {
    final String url = (apiPrefix + '/postalcode/validation');
    try {
      final response =
          await dio.get(url, queryParameters: {'postal_code': postCode});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final valid = response.data['valid'];

        return valid;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<List<SearchAddress>> searchAddress(String query) async {
    final String url = query.isEmpty
        ? (apiPrefix + '/subdistricts')
        : (apiPrefix + '/subdistricts/search');
    try {
      final response = query.isEmpty
          ? await dio.get(
              url,
            )
          : await dio.get(url, queryParameters: {'q': query});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonData = response.data['data'];

        final addresses = jsonData
            .map((addressData) =>
                SearchAddress.fromJson(addressData as Map<String, dynamic>))
            .toList();

        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<List<Province>> getProvinces() async {
    final String url = (apiPrefix + '/provinces');

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonData = response.data['data'];

        final addresses = jsonData
            .map((addressData) =>
                Province.fromJson(addressData as Map<String, dynamic>))
            .toList();

        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<List<District>> getDistricts() async {
    final String url = (apiPrefix + '/districts');

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonData = response.data['data'];

        final addresses = jsonData
            .map((addressData) =>
                District.fromJson(addressData as Map<String, dynamic>))
            .toList();

        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }

  Future<List<SubDistrict>> getSubDistricts() async {
    final String url = (apiPrefix + '/subdistricts');

    try {
      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> jsonData = response.data['data'];

        final addresses = jsonData
            .map((addressData) =>
                SubDistrict.fromJson(addressData as Map<String, dynamic>))
            .toList();

        return addresses;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      throw (' ${e.toString()}');
    }
  }
}
