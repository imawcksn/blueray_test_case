// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'address_id')
  int get addressId => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_id')
  int get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_name')
  String get provinceName => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_name')
  String get districtName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_name')
  String get subDistrictName => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_code')
  String get cityCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'npwp_file')
  String? get npwpFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number_2')
  String? get phoneNumber2 => throw _privateConstructorUsedError;
  String? get npwp => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_map')
  String? get addressMap => throw _privateConstructorUsedError;
  int get customer => throw _privateConstructorUsedError;
  int get province => throw _privateConstructorUsedError;
  int get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district')
  int get subDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'service')
  String? get service => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_type')
  String? get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_label')
  String? get addressLabel => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_name')
  String? get countryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_primary')
  bool? get isPrimary => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int get country => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {@JsonKey(name: 'address_id') int addressId,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'province_name') String provinceName,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'district_name') String districtName,
      @JsonKey(name: 'sub_district_id') int subDistrictId,
      @JsonKey(name: 'sub_district_name') String subDistrictName,
      @JsonKey(name: 'city_code') String cityCode,
      @JsonKey(name: 'npwp_file') String? npwpFile,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      String name,
      String address,
      @JsonKey(name: 'postal_code') String postalCode,
      String? email,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'phone_number_2') String? phoneNumber2,
      String? npwp,
      double? long,
      double? lat,
      @JsonKey(name: 'address_map') String? addressMap,
      int customer,
      int province,
      int district,
      @JsonKey(name: 'sub_district') int subDistrict,
      @JsonKey(name: 'service') String? service,
      @JsonKey(name: 'address_type') String? addressType,
      @JsonKey(name: 'address_label') String? addressLabel,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'is_primary') bool? isPrimary,
      String? note,
      int country});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? subDistrictId = null,
    Object? subDistrictName = null,
    Object? cityCode = null,
    Object? npwpFile = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? name = null,
    Object? address = null,
    Object? postalCode = null,
    Object? email = freezed,
    Object? phoneNumber = null,
    Object? phoneNumber2 = freezed,
    Object? npwp = freezed,
    Object? long = freezed,
    Object? lat = freezed,
    Object? addressMap = freezed,
    Object? customer = null,
    Object? province = null,
    Object? district = null,
    Object? subDistrict = null,
    Object? service = freezed,
    Object? addressType = freezed,
    Object? addressLabel = freezed,
    Object? countryName = freezed,
    Object? isPrimary = freezed,
    Object? note = freezed,
    Object? country = null,
  }) {
    return _then(_value.copyWith(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictName: null == subDistrictName
          ? _value.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String,
      npwpFile: freezed == npwpFile
          ? _value.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber2: freezed == phoneNumber2
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      addressMap: freezed == addressMap
          ? _value.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrict: null == subDistrict
          ? _value.subDistrict
          : subDistrict // ignore: cast_nullable_to_non_nullable
              as int,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLabel: freezed == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address_id') int addressId,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'province_name') String provinceName,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'district_name') String districtName,
      @JsonKey(name: 'sub_district_id') int subDistrictId,
      @JsonKey(name: 'sub_district_name') String subDistrictName,
      @JsonKey(name: 'city_code') String cityCode,
      @JsonKey(name: 'npwp_file') String? npwpFile,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'deleted_at') DateTime? deletedAt,
      String name,
      String address,
      @JsonKey(name: 'postal_code') String postalCode,
      String? email,
      @JsonKey(name: 'phone_number') String phoneNumber,
      @JsonKey(name: 'phone_number_2') String? phoneNumber2,
      String? npwp,
      double? long,
      double? lat,
      @JsonKey(name: 'address_map') String? addressMap,
      int customer,
      int province,
      int district,
      @JsonKey(name: 'sub_district') int subDistrict,
      @JsonKey(name: 'service') String? service,
      @JsonKey(name: 'address_type') String? addressType,
      @JsonKey(name: 'address_label') String? addressLabel,
      @JsonKey(name: 'country_name') String? countryName,
      @JsonKey(name: 'is_primary') bool? isPrimary,
      String? note,
      int country});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
    Object? provinceId = null,
    Object? provinceName = null,
    Object? districtId = null,
    Object? districtName = null,
    Object? subDistrictId = null,
    Object? subDistrictName = null,
    Object? cityCode = null,
    Object? npwpFile = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? name = null,
    Object? address = null,
    Object? postalCode = null,
    Object? email = freezed,
    Object? phoneNumber = null,
    Object? phoneNumber2 = freezed,
    Object? npwp = freezed,
    Object? long = freezed,
    Object? lat = freezed,
    Object? addressMap = freezed,
    Object? customer = null,
    Object? province = null,
    Object? district = null,
    Object? subDistrict = null,
    Object? service = freezed,
    Object? addressType = freezed,
    Object? addressLabel = freezed,
    Object? countryName = freezed,
    Object? isPrimary = freezed,
    Object? note = freezed,
    Object? country = null,
  }) {
    return _then(_$AddressImpl(
      addressId: null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceId: null == provinceId
          ? _value.provinceId
          : provinceId // ignore: cast_nullable_to_non_nullable
              as int,
      provinceName: null == provinceName
          ? _value.provinceName
          : provinceName // ignore: cast_nullable_to_non_nullable
              as String,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      districtName: null == districtName
          ? _value.districtName
          : districtName // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictName: null == subDistrictName
          ? _value.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
              as String,
      cityCode: null == cityCode
          ? _value.cityCode
          : cityCode // ignore: cast_nullable_to_non_nullable
              as String,
      npwpFile: freezed == npwpFile
          ? _value.npwpFile
          : npwpFile // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber2: freezed == phoneNumber2
          ? _value.phoneNumber2
          : phoneNumber2 // ignore: cast_nullable_to_non_nullable
              as String?,
      npwp: freezed == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String?,
      long: freezed == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      addressMap: freezed == addressMap
          ? _value.addressMap
          : addressMap // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as int,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as int,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrict: null == subDistrict
          ? _value.subDistrict
          : subDistrict // ignore: cast_nullable_to_non_nullable
              as int,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as String?,
      addressType: freezed == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLabel: freezed == addressLabel
          ? _value.addressLabel
          : addressLabel // ignore: cast_nullable_to_non_nullable
              as String?,
      countryName: freezed == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {@JsonKey(name: 'address_id') required this.addressId,
      @JsonKey(name: 'province_id') required this.provinceId,
      @JsonKey(name: 'province_name') required this.provinceName,
      @JsonKey(name: 'district_id') required this.districtId,
      @JsonKey(name: 'district_name') required this.districtName,
      @JsonKey(name: 'sub_district_id') required this.subDistrictId,
      @JsonKey(name: 'sub_district_name') required this.subDistrictName,
      @JsonKey(name: 'city_code') required this.cityCode,
      @JsonKey(name: 'npwp_file') this.npwpFile,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      required this.name,
      required this.address,
      @JsonKey(name: 'postal_code') required this.postalCode,
      required this.email,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      @JsonKey(name: 'phone_number_2') this.phoneNumber2,
      this.npwp,
      this.long,
      this.lat,
      @JsonKey(name: 'address_map') this.addressMap,
      required this.customer,
      required this.province,
      required this.district,
      @JsonKey(name: 'sub_district') required this.subDistrict,
      @JsonKey(name: 'service') this.service,
      @JsonKey(name: 'address_type') this.addressType,
      @JsonKey(name: 'address_label') this.addressLabel,
      @JsonKey(name: 'country_name') this.countryName,
      @JsonKey(name: 'is_primary') this.isPrimary,
      this.note,
      required this.country});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey(name: 'address_id')
  final int addressId;
  @override
  @JsonKey(name: 'province_id')
  final int provinceId;
  @override
  @JsonKey(name: 'province_name')
  final String provinceName;
  @override
  @JsonKey(name: 'district_id')
  final int districtId;
  @override
  @JsonKey(name: 'district_name')
  final String districtName;
  @override
  @JsonKey(name: 'sub_district_id')
  final int subDistrictId;
  @override
  @JsonKey(name: 'sub_district_name')
  final String subDistrictName;
  @override
  @JsonKey(name: 'city_code')
  final String cityCode;
  @override
  @JsonKey(name: 'npwp_file')
  final String? npwpFile;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  final DateTime? deletedAt;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  final String? email;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  @JsonKey(name: 'phone_number_2')
  final String? phoneNumber2;
  @override
  final String? npwp;
  @override
  final double? long;
  @override
  final double? lat;
  @override
  @JsonKey(name: 'address_map')
  final String? addressMap;
  @override
  final int customer;
  @override
  final int province;
  @override
  final int district;
  @override
  @JsonKey(name: 'sub_district')
  final int subDistrict;
  @override
  @JsonKey(name: 'service')
  final String? service;
  @override
  @JsonKey(name: 'address_type')
  final String? addressType;
  @override
  @JsonKey(name: 'address_label')
  final String? addressLabel;
  @override
  @JsonKey(name: 'country_name')
  final String? countryName;
  @override
  @JsonKey(name: 'is_primary')
  final bool? isPrimary;
  @override
  final String? note;
  @override
  final int country;

  @override
  String toString() {
    return 'Address(addressId: $addressId, provinceId: $provinceId, provinceName: $provinceName, districtId: $districtId, districtName: $districtName, subDistrictId: $subDistrictId, subDistrictName: $subDistrictName, cityCode: $cityCode, npwpFile: $npwpFile, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, name: $name, address: $address, postalCode: $postalCode, email: $email, phoneNumber: $phoneNumber, phoneNumber2: $phoneNumber2, npwp: $npwp, long: $long, lat: $lat, addressMap: $addressMap, customer: $customer, province: $province, district: $district, subDistrict: $subDistrict, service: $service, addressType: $addressType, addressLabel: $addressLabel, countryName: $countryName, isPrimary: $isPrimary, note: $note, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.provinceName, provinceName) ||
                other.provinceName == provinceName) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.districtName, districtName) ||
                other.districtName == districtName) &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId) &&
            (identical(other.subDistrictName, subDistrictName) ||
                other.subDistrictName == subDistrictName) &&
            (identical(other.cityCode, cityCode) ||
                other.cityCode == cityCode) &&
            (identical(other.npwpFile, npwpFile) ||
                other.npwpFile == npwpFile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneNumber2, phoneNumber2) ||
                other.phoneNumber2 == phoneNumber2) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.addressMap, addressMap) ||
                other.addressMap == addressMap) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.subDistrict, subDistrict) ||
                other.subDistrict == subDistrict) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.addressLabel, addressLabel) ||
                other.addressLabel == addressLabel) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        addressId,
        provinceId,
        provinceName,
        districtId,
        districtName,
        subDistrictId,
        subDistrictName,
        cityCode,
        npwpFile,
        createdAt,
        updatedAt,
        deletedAt,
        name,
        address,
        postalCode,
        email,
        phoneNumber,
        phoneNumber2,
        npwp,
        long,
        lat,
        addressMap,
        customer,
        province,
        district,
        subDistrict,
        service,
        addressType,
        addressLabel,
        countryName,
        isPrimary,
        note,
        country
      ]);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {@JsonKey(name: 'address_id') required final int addressId,
      @JsonKey(name: 'province_id') required final int provinceId,
      @JsonKey(name: 'province_name') required final String provinceName,
      @JsonKey(name: 'district_id') required final int districtId,
      @JsonKey(name: 'district_name') required final String districtName,
      @JsonKey(name: 'sub_district_id') required final int subDistrictId,
      @JsonKey(name: 'sub_district_name') required final String subDistrictName,
      @JsonKey(name: 'city_code') required final String cityCode,
      @JsonKey(name: 'npwp_file') final String? npwpFile,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'deleted_at') final DateTime? deletedAt,
      required final String name,
      required final String address,
      @JsonKey(name: 'postal_code') required final String postalCode,
      required final String? email,
      @JsonKey(name: 'phone_number') required final String phoneNumber,
      @JsonKey(name: 'phone_number_2') final String? phoneNumber2,
      final String? npwp,
      final double? long,
      final double? lat,
      @JsonKey(name: 'address_map') final String? addressMap,
      required final int customer,
      required final int province,
      required final int district,
      @JsonKey(name: 'sub_district') required final int subDistrict,
      @JsonKey(name: 'service') final String? service,
      @JsonKey(name: 'address_type') final String? addressType,
      @JsonKey(name: 'address_label') final String? addressLabel,
      @JsonKey(name: 'country_name') final String? countryName,
      @JsonKey(name: 'is_primary') final bool? isPrimary,
      final String? note,
      required final int country}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @JsonKey(name: 'address_id')
  int get addressId;
  @override
  @JsonKey(name: 'province_id')
  int get provinceId;
  @override
  @JsonKey(name: 'province_name')
  String get provinceName;
  @override
  @JsonKey(name: 'district_id')
  int get districtId;
  @override
  @JsonKey(name: 'district_name')
  String get districtName;
  @override
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId;
  @override
  @JsonKey(name: 'sub_district_name')
  String get subDistrictName;
  @override
  @JsonKey(name: 'city_code')
  String get cityCode;
  @override
  @JsonKey(name: 'npwp_file')
  String? get npwpFile;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'deleted_at')
  DateTime? get deletedAt;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  String? get email;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber;
  @override
  @JsonKey(name: 'phone_number_2')
  String? get phoneNumber2;
  @override
  String? get npwp;
  @override
  double? get long;
  @override
  double? get lat;
  @override
  @JsonKey(name: 'address_map')
  String? get addressMap;
  @override
  int get customer;
  @override
  int get province;
  @override
  int get district;
  @override
  @JsonKey(name: 'sub_district')
  int get subDistrict;
  @override
  @JsonKey(name: 'service')
  String? get service;
  @override
  @JsonKey(name: 'address_type')
  String? get addressType;
  @override
  @JsonKey(name: 'address_label')
  String? get addressLabel;
  @override
  @JsonKey(name: 'country_name')
  String? get countryName;
  @override
  @JsonKey(name: 'is_primary')
  bool? get isPrimary;
  @override
  String? get note;
  @override
  int get country;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
