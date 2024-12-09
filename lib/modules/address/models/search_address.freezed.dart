// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchAddress _$SearchAddressFromJson(Map<String, dynamic> json) {
  return _SearchAddress.fromJson(json);
}

/// @nodoc
mixin _$SearchAddress {
  String get address => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district')
  String get subDistrict => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_code')
  String get subDistrictCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'province_id')
  int get provinceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId => throw _privateConstructorUsedError;

  /// Serializes this SearchAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SearchAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchAddressCopyWith<SearchAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAddressCopyWith<$Res> {
  factory $SearchAddressCopyWith(
          SearchAddress value, $Res Function(SearchAddress) then) =
      _$SearchAddressCopyWithImpl<$Res, SearchAddress>;
  @useResult
  $Res call(
      {String address,
      String province,
      String district,
      @JsonKey(name: 'sub_district') String subDistrict,
      @JsonKey(name: 'sub_district_code') String subDistrictCode,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_id') int subDistrictId});
}

/// @nodoc
class _$SearchAddressCopyWithImpl<$Res, $Val extends SearchAddress>
    implements $SearchAddressCopyWith<$Res> {
  _$SearchAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? province = null,
    Object? district = null,
    Object? subDistrict = null,
    Object? subDistrictCode = null,
    Object? provinceId = null,
    Object? districtId = null,
    Object? subDistrictId = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrict: null == subDistrict
          ? _value.subDistrict
          : subDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrictCode: null == subDistrictCode
          ? _value.subDistrictCode
          : subDistrictCode // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$SearchAddressImplCopyWith<$Res>
    implements $SearchAddressCopyWith<$Res> {
  factory _$$SearchAddressImplCopyWith(
          _$SearchAddressImpl value, $Res Function(_$SearchAddressImpl) then) =
      __$$SearchAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String address,
      String province,
      String district,
      @JsonKey(name: 'sub_district') String subDistrict,
      @JsonKey(name: 'sub_district_code') String subDistrictCode,
      @JsonKey(name: 'province_id') int provinceId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_id') int subDistrictId});
}

/// @nodoc
class __$$SearchAddressImplCopyWithImpl<$Res>
    extends _$SearchAddressCopyWithImpl<$Res, _$SearchAddressImpl>
    implements _$$SearchAddressImplCopyWith<$Res> {
  __$$SearchAddressImplCopyWithImpl(
      _$SearchAddressImpl _value, $Res Function(_$SearchAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? province = null,
    Object? district = null,
    Object? subDistrict = null,
    Object? subDistrictCode = null,
    Object? provinceId = null,
    Object? districtId = null,
    Object? subDistrictId = null,
  }) {
    return _then(_$SearchAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrict: null == subDistrict
          ? _value.subDistrict
          : subDistrict // ignore: cast_nullable_to_non_nullable
              as String,
      subDistrictCode: null == subDistrictCode
          ? _value.subDistrictCode
          : subDistrictCode // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$SearchAddressImpl implements _SearchAddress {
  const _$SearchAddressImpl(
      {required this.address,
      required this.province,
      required this.district,
      @JsonKey(name: 'sub_district') required this.subDistrict,
      @JsonKey(name: 'sub_district_code') required this.subDistrictCode,
      @JsonKey(name: 'province_id') required this.provinceId,
      @JsonKey(name: 'district_id') required this.districtId,
      @JsonKey(name: 'sub_district_id') required this.subDistrictId});

  factory _$SearchAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchAddressImplFromJson(json);

  @override
  final String address;
  @override
  final String province;
  @override
  final String district;
  @override
  @JsonKey(name: 'sub_district')
  final String subDistrict;
  @override
  @JsonKey(name: 'sub_district_code')
  final String subDistrictCode;
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
    return 'SearchAddress(address: $address, province: $province, district: $district, subDistrict: $subDistrict, subDistrictCode: $subDistrictCode, provinceId: $provinceId, districtId: $districtId, subDistrictId: $subDistrictId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchAddressImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.subDistrict, subDistrict) ||
                other.subDistrict == subDistrict) &&
            (identical(other.subDistrictCode, subDistrictCode) ||
                other.subDistrictCode == subDistrictCode) &&
            (identical(other.provinceId, provinceId) ||
                other.provinceId == provinceId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, address, province, district,
      subDistrict, subDistrictCode, provinceId, districtId, subDistrictId);

  /// Create a copy of SearchAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchAddressImplCopyWith<_$SearchAddressImpl> get copyWith =>
      __$$SearchAddressImplCopyWithImpl<_$SearchAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchAddressImplToJson(
      this,
    );
  }
}

abstract class _SearchAddress implements SearchAddress {
  const factory _SearchAddress(
      {required final String address,
      required final String province,
      required final String district,
      @JsonKey(name: 'sub_district') required final String subDistrict,
      @JsonKey(name: 'sub_district_code') required final String subDistrictCode,
      @JsonKey(name: 'province_id') required final int provinceId,
      @JsonKey(name: 'district_id') required final int districtId,
      @JsonKey(name: 'sub_district_id')
      required final int subDistrictId}) = _$SearchAddressImpl;

  factory _SearchAddress.fromJson(Map<String, dynamic> json) =
      _$SearchAddressImpl.fromJson;

  @override
  String get address;
  @override
  String get province;
  @override
  String get district;
  @override
  @JsonKey(name: 'sub_district')
  String get subDistrict;
  @override
  @JsonKey(name: 'sub_district_code')
  String get subDistrictCode;
  @override
  @JsonKey(name: 'province_id')
  int get provinceId;
  @override
  @JsonKey(name: 'district_id')
  int get districtId;
  @override
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId;

  /// Create a copy of SearchAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchAddressImplCopyWith<_$SearchAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
