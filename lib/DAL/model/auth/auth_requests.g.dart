// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationFormLogin _$AuthenticationFormLoginFromJson(
    Map<String, dynamic> json) {
  return AuthenticationFormLogin(
    userName: json['user_name'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$AuthenticationFormLoginToJson(
        AuthenticationFormLogin instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'password': instance.password,
    };
