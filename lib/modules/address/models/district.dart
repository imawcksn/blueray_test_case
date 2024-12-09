import 'package:freezed_annotation/freezed_annotation.dart';

part 'district.freezed.dart';
part 'district.g.dart';

@freezed
class District with _$District {
  const factory District({
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'district_id') required int districtId,
    @JsonKey(name: 'district_name') required String districtName,
  }) = _District;

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
