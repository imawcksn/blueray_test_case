// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateAddressImpl _$$CreateAddressImplFromJson(Map<String, dynamic> json) =>
    _$CreateAddressImpl(
      address: json['address'] as String,
      addressLabel: json['address_label'] as String,
      name: json['name'] as String,
      phoneNumber: json['phone_number'] as String,
      email: json['email'] as String?,
      postalCode: json['postal_code'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      addressMap: json['address_map'] as String,
      npwp: json['npwp'] as String?,
      npwpFile: json['npwp_file'] as String?,
      provinceId: (json['province_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      subDistrictId: (json['sub_district_id'] as num).toInt(),
    );

Map<String, dynamic> _$$CreateAddressImplToJson(_$CreateAddressImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'address_label': instance.addressLabel,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'postal_code': instance.postalCode,
      'lat': instance.lat,
      'long': instance.long,
      'address_map': instance.addressMap,
      'npwp': instance.npwp,
      'npwp_file': instance.npwpFile,
      'province_id': instance.provinceId,
      'district_id': instance.districtId,
      'sub_district_id': instance.subDistrictId,
    };
