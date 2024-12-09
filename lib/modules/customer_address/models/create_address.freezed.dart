// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateAddress _$CreateAddressFromJson(Map<String, dynamic> json) {
  return _CreateAddress.fromJson(json);
}

/// @nodoc
mixin _$CreateAddress {
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_label')
  String get addressLabel => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_map')
  String get addressMap => throw _privateConstructorUsedError;
  String? get npwp => throw _privateConstructorUsedError;
  @JsonKey(name: 'npwp_file')
  String? get npwpFile =>
      throw _privateConstructorUsedError; // Added missing comma here
  @JsonKey(name: 'province_id')
  int get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId => throw _privateConstructorUsedError;

  /// Serializes this CreateAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateAddressCopyWith<CreateAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAddressCopyWith<$Res> {
  factory $CreateAddressCopyWith(
          CreateAddress value, $Res Function(CreateAddress) then) =
      _$CreateAddressCopyWithImpl<$Res, CreateAddress>;
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'address_label') String addressLabel,
      String name,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? email,
      @JsonKey(name: 'postal_code') String postalCode,
      double lat,
      double long,
      @JsonKey(name: 'address_map') String addressMap,
      String? npwp,
      @JsonKey(name: 'npwp_file') String? npwpFile,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_id') int subDistrictId});
}

/// @nodoc
class _$CreateAddressCopyWithImpl<$Res, $Val extends CreateAddress>
    implements $CreateAddressCopyWith<$Res> {
  _$CreateAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? addressLabel = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? postalCode = null,
    Object? lat = null,
    Object? long = null,
    Object? addressMap = null,
    Object? npwp = freezed,
    Object? npwpFile = freezed,
    Object? provinceId = null,
    Object? districtId = null,
    Object? subDistrictId = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressLabel: null == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      addressMap: null == addressMap
          ? _value.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
              as String,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      npwpFile: freezed == npwpFile
          ? _value.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAddressImplCopyWith<$Res>
    implements $CreateAddressCopyWith<$Res> {
  factory _$$CreateAddressImplCopyWith(
          _$CreateAddressImpl value, $Res Function(_$CreateAddressImpl) then) =
      __$$CreateAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'address_label') String addressLabel,
      String name,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String? email,
      @JsonKey(name: 'postal_code') String postalCode,
      double lat,
      double long,
      @JsonKey(name: 'address_map') String addressMap,
      String? npwp,
      @JsonKey(name: 'npwp_file') String? npwpFile,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_id') int subDistrictId});
}

/// @nodoc
class __$$CreateAddressImplCopyWithImpl<$Res>
    extends _$CreateAddressCopyWithImpl<$Res, _$CreateAddressImpl>
    implements _$$CreateAddressImplCopyWith<$Res> {
  __$$CreateAddressImplCopyWithImpl(
      _$CreateAddressImpl _value, $Res Function(_$CreateAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? addressLabel = null,
    Object? name = null,
    Object? phoneNumber = null,
    Object? email = freezed,
    Object? postalCode = null,
    Object? lat = null,
    Object? long = null,
    Object? addressMap = null,
    Object? npwp = freezed,
    Object? npwpFile = freezed,
    Object? provinceId = null,
    Object? districtId = null,
    Object? subDistrictId = null,
  }) {
    return _then(_$CreateAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressLabel: null == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      addressMap: null == addressMap
          ? _value.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
              as String,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      npwpFile: freezed == npwpFile
          ? _value.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
              as String?,
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateAddressImpl implements _CreateAddress {
  const _$CreateAddressImpl(
      {required this.address,
      @JsonKey(name: 'address_label') required this.addressLabel,
      required this.name,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      this.email,
      @JsonKey(name: 'postal_code') required this.postalCode,
      required this.lat,
      required this.long,
      @JsonKey(name: 'address_map') required this.addressMap,
      this.npwp,
      @JsonKey(name: 'npwp_file') this.npwpFile,
      @JsonKey(name: 'province_id') required this.provinceId,
      @JsonKey(name: 'district_id') required this.districtId,
      @JsonKey(name: 'sub_district_id') required this.subDistrictId});

  factory _$CreateAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateAddressImplFromJson(json);

  @override
  final String address;
  @override
  @JsonKey(name: 'address_label')
  final String addressLabel;
  @override
  final String name;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String? email;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  final double lat;
  @override
  final double long;
  @override
  @JsonKey(name: 'address_map')
  final String addressMap;
  @override
  final String? npwp;
  @override
  @JsonKey(name: 'npwp_file')
  final String? npwpFile;
// Added missing comma here
  @override
  @JsonKey(name: 'province_id')
  final int provinceId;
  @override
  @JsonKey(name: 'district_id')
  final int districtId;
  @override
  @JsonKey(name: 'sub_district_id')
  final int subDistrictId;

  @override
  String toString() {
    return 'CreateAddress(address: $address, addressLabel: $addressLabel, name: $name, phoneNumber: $phoneNumber, email: $email, postalCode: $postalCode, lat: $lat, long: $long, addressMap: $addressMap, npwp: $npwp, npwpFile: $npwpFile, provinceId: $provinceId, districtId: $districtId, subDistrictId: $subDistrictId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressLabel, addressLabel) ||
                other.addressLabel == addressLabel) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.addressMap, addressMap) ||
                other.addressMap == addressMap) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.npwpFile, npwpFile) ||
                other.npwpFile == npwpFile) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      addressLabel,
      name,
      phoneNumber,
      email,
      postalCode,
      lat,
      long,
      addressMap,
      npwp,
      npwpFile,
      provinceId,
      districtId,
      subDistrictId);

  /// Create a copy of CreateAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAddressImplCopyWith<_$CreateAddressImpl> get copyWith =>
      __$$CreateAddressImplCopyWithImpl<_$CreateAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateAddressImplToJson(
      this,
    );
  }
}

abstract class _CreateAddress implements CreateAddress {
  const factory _CreateAddress(
          {required final String address,
          @JsonKey(name: 'address_label') required final String addressLabel,
          required final String name,
          @JsonKey(name: 'phone_number') required final String phoneNumber,
          final String? email,
          @JsonKey(name: 'postal_code') required final String postalCode,
          required final double lat,
          required final double long,
          @JsonKey(name: 'address_map') required final String addressMap,
          final String? npwp,
          @JsonKey(name: 'npwp_file') final String? npwpFile,
          @JsonKey(name: 'province_id') required final int provinceId,
          @JsonKey(name: 'district_id') required final int districtId,
          @JsonKey(name: 'sub_district_id') required final int subDistrictId}) =
      _$CreateAddressImpl;

  factory _CreateAddress.fromJson(Map<String, dynamic> json) =
      _$CreateAddressImpl.fromJson;

  @override
  String get address;
  @override
  @JsonKey(name: 'address_label')
  String get addressLabel;
  @override
  String get name;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  String? get email;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  double get lat;
  @override
  double get long;
  @override
  @JsonKey(name: 'address_map')
  String get addressMap;
  @override
  String? get npwp;
  @override
  @JsonKey(name: 'npwp_file')
  String? get npwpFile; // Added missing comma here
  @override
  @JsonKey(name: 'province_id')
  int get provinceId;
  @override
  @JsonKey(name: 'district_id')
  int get districtId;
  @override
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId;

  /// Create a copy of CreateAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateAddressImplCopyWith<_$CreateAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
