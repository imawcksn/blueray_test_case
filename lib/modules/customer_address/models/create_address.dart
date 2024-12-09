import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_address.freezed.dart';
part 'create_address.g.dart';

@freezed
class CreateAddress with _$CreateAddress {
  const factory CreateAddress({
    required String address,
    @JsonKey(name: 'address_label') required String addressLabel,
    required String name,
    @JsonKey(name: 'phone_number') required String phoneNumber,
    String? email,
    @JsonKey(name: 'postal_code') required String postalCode,
    required double lat,
    required double long,
    @JsonKey(name: 'address_map') required String addressMap,
    String? npwp,
    @JsonKey(name: 'npwp_file') String? npwpFile, 
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
  }) = _CreateAddress;

  factory CreateAddress.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressFromJson(json);
}
