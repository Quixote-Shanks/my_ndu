// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthResponseCWProxy {
  AuthResponse success(bool? success);

  AuthResponse message(String? message);

  AuthResponse token(String? token);

  AuthResponse expiresAt(int? expiresAt);

  AuthResponse role(String? role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthResponse call({
    bool? success,
    String? message,
    String? token,
    int? expiresAt,
    String? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthResponse.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthResponse.copyWith.fieldName(...)`
class _$AuthResponseCWProxyImpl implements _$AuthResponseCWProxy {
  const _$AuthResponseCWProxyImpl(this._value);

  final AuthResponse _value;

  @override
  AuthResponse success(bool? success) => this(success: success);

  @override
  AuthResponse message(String? message) => this(message: message);

  @override
  AuthResponse token(String? token) => this(token: token);

  @override
  AuthResponse expiresAt(int? expiresAt) => this(expiresAt: expiresAt);

  @override
  AuthResponse role(String? role) => this(role: role);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthResponse(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthResponse(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthResponse call({
    Object? success = const $CopyWithPlaceholder(),
    Object? message = const $CopyWithPlaceholder(),
    Object? token = const $CopyWithPlaceholder(),
    Object? expiresAt = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return AuthResponse(
      success: success == const $CopyWithPlaceholder()
          ? _value.success
          // ignore: cast_nullable_to_non_nullable
          : success as bool?,
      message: message == const $CopyWithPlaceholder()
          ? _value.message
          // ignore: cast_nullable_to_non_nullable
          : message as String?,
      token: token == const $CopyWithPlaceholder()
          ? _value.token
          // ignore: cast_nullable_to_non_nullable
          : token as String?,
      expiresAt: expiresAt == const $CopyWithPlaceholder()
          ? _value.expiresAt
          // ignore: cast_nullable_to_non_nullable
          : expiresAt as int?,
      role: role == const $CopyWithPlaceholder()
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as String?,
    );
  }
}

extension $AuthResponseCopyWith on AuthResponse {
  /// Returns a callable class that can be used as follows: `instanceOfAuthResponse.copyWith(...)` or like so:`instanceOfAuthResponse.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthResponseCWProxy get copyWith => _$AuthResponseCWProxyImpl(this);
}

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthResponseAdapter extends TypeAdapter<AuthResponse> {
  @override
  final int typeId = 13;

  @override
  AuthResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthResponse(
      success: fields[0] as bool?,
      message: fields[1] as String?,
      token: fields[2] as String?,
      expiresAt: fields[3] as int?,
      role: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthResponse obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.token)
      ..writeByte(3)
      ..write(obj.expiresAt)
      ..writeByte(4)
      ..write(obj.role);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      token: json['token'] as String?,
      expiresAt: json['expiresAt'] as int?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'token': instance.token,
      'expiresAt': instance.expiresAt,
      'role': instance.role,
    };
