import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_address.freezed.dart';
part 'search_address.g.dart';

@freezed
class SearchAddress with _$SearchAddress {
  const factory SearchAddress({
    required String address,
    required String province,
    required String district,
    @JsonKey(name: 'sub_district') required String subDistrict,
    @JsonKey(name: 'sub_district_code') required String subDistrictCode,
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
  }) = _SearchAddress;

  factory SearchAddress.fromJson(Map<String, dynamic> json) =>
      _$SearchAddressFromJson(json);
}
