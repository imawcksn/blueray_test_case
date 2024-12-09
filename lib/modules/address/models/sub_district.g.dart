// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_district.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubDistrictImpl _$$SubDistrictImplFromJson(Map<String, dynamic> json) =>
    _$SubDistrictImpl(
      subDistrictId: (json['sub_district_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      subDistrictName: json['sub_district_name'] as String,
    );

Map<String, dynamic> _$$SubDistrictImplToJson(_$SubDistrictImpl instance) =>
    <String, dynamic>{
      'sub_district_id': instance.subDistrictId,
      'district_id': instance.districtId,
      'sub_district_name': instance.subDistrictName,
    };
