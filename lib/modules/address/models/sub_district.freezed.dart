// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_district.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SubDistrict _$SubDistrictFromJson(Map<String, dynamic> json) {
  return _SubDistrict.fromJson(json);
}

/// @nodoc
mixin _$SubDistrict {
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId => throw _privateConstructorUsedError;
  @JsonKey(name: 'district_id')
  int get districtId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_district_name')
  String get subDistrictName => throw _privateConstructorUsedError;

  /// Serializes this SubDistrict to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubDistrict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubDistrictCopyWith<SubDistrict> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubDistrictCopyWith<$Res> {
  factory $SubDistrictCopyWith(
          SubDistrict value, $Res Function(SubDistrict) then) =
      _$SubDistrictCopyWithImpl<$Res, SubDistrict>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_district_id') int subDistrictId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_name') String subDistrictName});
}

/// @nodoc
class _$SubDistrictCopyWithImpl<$Res, $Val extends SubDistrict>
    implements $SubDistrictCopyWith<$Res> {
  _$SubDistrictCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubDistrict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subDistrictId = null,
    Object? districtId = null,
    Object? subDistrictName = null,
  }) {
    return _then(_value.copyWith(
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictName: null == subDistrictName
          ? _value.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubDistrictImplCopyWith<$Res>
    implements $SubDistrictCopyWith<$Res> {
  factory _$$SubDistrictImplCopyWith(
          _$SubDistrictImpl value, $Res Function(_$SubDistrictImpl) then) =
      __$$SubDistrictImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sub_district_id') int subDistrictId,
      @JsonKey(name: 'district_id') int districtId,
      @JsonKey(name: 'sub_district_name') String subDistrictName});
}

/// @nodoc
class __$$SubDistrictImplCopyWithImpl<$Res>
    extends _$SubDistrictCopyWithImpl<$Res, _$SubDistrictImpl>
    implements _$$SubDistrictImplCopyWith<$Res> {
  __$$SubDistrictImplCopyWithImpl(
      _$SubDistrictImpl _value, $Res Function(_$SubDistrictImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubDistrict
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subDistrictId = null,
    Object? districtId = null,
    Object? subDistrictName = null,
  }) {
    return _then(_$SubDistrictImpl(
      subDistrictId: null == subDistrictId
          ? _value.subDistrictId
          : subDistrictId // ignore: cast_nullable_to_non_nullable
              as int,
      districtId: null == districtId
          ? _value.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as int,
      subDistrictName: null == subDistrictName
          ? _value.subDistrictName
          : subDistrictName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubDistrictImpl implements _SubDistrict {
  const _$SubDistrictImpl(
      {@JsonKey(name: 'sub_district_id') required this.subDistrictId,
      @JsonKey(name: 'district_id') required this.districtId,
      @JsonKey(name: 'sub_district_name') required this.subDistrictName});

  factory _$SubDistrictImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubDistrictImplFromJson(json);

  @override
  @JsonKey(name: 'sub_district_id')
  final int subDistrictId;
  @override
  @JsonKey(name: 'district_id')
  final int districtId;
  @override
  @JsonKey(name: 'sub_district_name')
  final String subDistrictName;

  @override
  String toString() {
    return 'SubDistrict(subDistrictId: $subDistrictId, districtId: $districtId, subDistrictName: $subDistrictName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubDistrictImpl &&
            (identical(other.subDistrictId, subDistrictId) ||
                other.subDistrictId == subDistrictId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId) &&
            (identical(other.subDistrictName, subDistrictName) ||
                other.subDistrictName == subDistrictName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, subDistrictId, districtId, subDistrictName);

  /// Create a copy of SubDistrict
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubDistrictImplCopyWith<_$SubDistrictImpl> get copyWith =>
      __$$SubDistrictImplCopyWithImpl<_$SubDistrictImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubDistrictImplToJson(
      this,
    );
  }
}

abstract class _SubDistrict implements SubDistrict {
  const factory _SubDistrict(
      {@JsonKey(name: 'sub_district_id') required final int subDistrictId,
      @JsonKey(name: 'district_id') required final int districtId,
      @JsonKey(name: 'sub_district_name')
      required final String subDistrictName}) = _$SubDistrictImpl;

  factory _SubDistrict.fromJson(Map<String, dynamic> json) =
      _$SubDistrictImpl.fromJson;

  @override
  @JsonKey(name: 'sub_district_id')
  int get subDistrictId;
  @override
  @JsonKey(name: 'district_id')
  int get districtId;
  @override
  @JsonKey(name: 'sub_district_name')
  String get subDistrictName;

  /// Create a copy of SubDistrict
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubDistrictImplCopyWith<_$SubDistrictImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
