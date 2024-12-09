// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_mandatory_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterMandatoryRequestImpl _$$RegisterMandatoryRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterMandatoryRequestImpl(
      userId: json['user_id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      idCardNumber: json['id_card_number'] as String,
      idCardImage: json['id_card_image'] as String,
      idCardAddress: json['id_card_address'] as String,
      idCardName: json['id_card_name'] as String,
    );

Map<String, dynamic> _$$RegisterMandatoryRequestImplToJson(
        _$RegisterMandatoryRequestImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'id_card_number': instance.idCardNumber,
      'id_card_image': instance.idCardImage,
      'id_card_address': instance.idCardAddress,
      'id_card_name': instance.idCardName,
    };
