// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_exam_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateExamParams _$UpdateExamParamsFromJson(Map<String, dynamic> json) {
  return _UpdateExamParams.fromJson(json);
}

/// @nodoc
mixin _$UpdateExamParams {
  int get id => throw _privateConstructorUsedError;
  int get clubId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime? get dueAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateExamParamsCopyWith<UpdateExamParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateExamParamsCopyWith<$Res> {
  factory $UpdateExamParamsCopyWith(
          UpdateExamParams value, $Res Function(UpdateExamParams) then) =
      _$UpdateExamParamsCopyWithImpl<$Res, UpdateExamParams>;
  @useResult
  $Res call(
      {int id, int clubId, String name, String description, DateTime? dueAt});
}

/// @nodoc
class _$UpdateExamParamsCopyWithImpl<$Res, $Val extends UpdateExamParams>
    implements $UpdateExamParamsCopyWith<$Res> {
  _$UpdateExamParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? name = null,
    Object? description = null,
    Object? dueAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateExamParamsImplCopyWith<$Res>
    implements $UpdateExamParamsCopyWith<$Res> {
  factory _$$UpdateExamParamsImplCopyWith(_$UpdateExamParamsImpl value,
          $Res Function(_$UpdateExamParamsImpl) then) =
      __$$UpdateExamParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, int clubId, String name, String description, DateTime? dueAt});
}

/// @nodoc
class __$$UpdateExamParamsImplCopyWithImpl<$Res>
    extends _$UpdateExamParamsCopyWithImpl<$Res, _$UpdateExamParamsImpl>
    implements _$$UpdateExamParamsImplCopyWith<$Res> {
  __$$UpdateExamParamsImplCopyWithImpl(_$UpdateExamParamsImpl _value,
      $Res Function(_$UpdateExamParamsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clubId = null,
    Object? name = null,
    Object? description = null,
    Object? dueAt = freezed,
  }) {
    return _then(_$UpdateExamParamsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      clubId: null == clubId
          ? _value.clubId
          : clubId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueAt: freezed == dueAt
          ? _value.dueAt
          : dueAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateExamParamsImpl implements _UpdateExamParams {
  const _$UpdateExamParamsImpl(
      {this.id = 0,
      this.clubId = 0,
      this.name = '',
      this.description = '',
      this.dueAt});

  factory _$UpdateExamParamsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateExamParamsImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int clubId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  final DateTime? dueAt;

  @override
  String toString() {
    return 'UpdateExamParams(id: $id, clubId: $clubId, name: $name, description: $description, dueAt: $dueAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateExamParamsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clubId, clubId) || other.clubId == clubId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueAt, dueAt) || other.dueAt == dueAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, clubId, name, description, dueAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateExamParamsImplCopyWith<_$UpdateExamParamsImpl> get copyWith =>
      __$$UpdateExamParamsImplCopyWithImpl<_$UpdateExamParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateExamParamsImplToJson(
      this,
    );
  }
}

abstract class _UpdateExamParams implements UpdateExamParams {
  const factory _UpdateExamParams(
      {final int id,
      final int clubId,
      final String name,
      final String description,
      final DateTime? dueAt}) = _$UpdateExamParamsImpl;

  factory _UpdateExamParams.fromJson(Map<String, dynamic> json) =
      _$UpdateExamParamsImpl.fromJson;

  @override
  int get id;
  @override
  int get clubId;
  @override
  String get name;
  @override
  String get description;
  @override
  DateTime? get dueAt;
  @override
  @JsonKey(ignore: true)
  _$$UpdateExamParamsImplCopyWith<_$UpdateExamParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}