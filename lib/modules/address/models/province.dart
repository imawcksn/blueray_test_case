import 'package:freezed_annotation/freezed_annotation.dart';

part 'province.freezed.dart';
part 'province.g.dart';

@freezed
class Province with _$Province {
  const factory Province({
    @JsonKey(name: 'province_id') required int provinceId,
    @JsonKey(name: 'province_name') required String provinceName,
  }) = _Province;

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);
}
