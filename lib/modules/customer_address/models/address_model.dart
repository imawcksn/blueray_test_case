import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'address_id') required int addressId,
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'province_name') required String provinceName,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'district_name') required String districtName,
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
    @JsonKey(name: 'sub_district_name') required String subDistrictName,
    @JsonKey(name: 'city_code') required String cityCode,
    @JsonKey(name: 'npwp_file') String? npwpFile,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'deleted_at') DateTime? deletedAt,
    required String name,
    required String address,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String? email,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    @JsonKey(name: 'phone_number_2') String? phoneNumber2,
    String? npwp,
    double? long,
    double? lat,
    @JsonKey(name: 'address_map') String? addressMap,
    required int customer,
    required int province,
    required int district,
    @JsonKey(name: 'sub_district') required int subDistrict,
    @JsonKey(name: 'service') String? service,
    @JsonKey(name: 'address_type') String? addressType,
    @JsonKey(name: 'address_label') String? addressLabel,
    @JsonKey(name: 'country_name') String? countryName,
    @JsonKey(name: 'is_primary') bool? isPrimary,
    String? note,
    required int country,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
}
