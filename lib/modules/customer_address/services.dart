import 'dart:convert';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/config/dio_client.dart';
import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
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
}
