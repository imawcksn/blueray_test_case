import 'package:freezed_annotation/freezed_annotation.dart';

part 'sub_district.freezed.dart';
part 'sub_district.g.dart';

@freezed
class SubDistrict with _$SubDistrict {
  const factory SubDistrict({
    @JsonKey(name: 'sub_district_id') required int subDistrictId,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'sub_district_name') required String subDistrictName,
  }) = _SubDistrict;

  factory SubDistrict.fromJson(Map<String, dynamic> json) =>
      _$SubDistrictFromJson(json);
}
