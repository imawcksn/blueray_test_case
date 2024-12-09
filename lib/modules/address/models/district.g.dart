// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DistrictImpl _$$DistrictImplFromJson(Map<String, dynamic> json) =>
    _$DistrictImpl(
      provinceId: (json['province_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      districtName: json['district_name'] as String,
    );

Map<String, dynamic> _$$DistrictImplToJson(_$DistrictImpl instance) =>
    <String, dynamic>{
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'district_name': instance.districtName,
    };
