// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultUser _$ResultUserFromJson(Map<String, dynamic> json) {
  return ResultUser(
    responseLogin: ResponseLogin.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultUserToJson(ResultUser instance) =>
    <String, dynamic>{
      'data': instance.responseLogin,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    role: json['role'] as String?,
    id: json['id'] as int,
    user_id: json['user_id'] as int?,
    name: json['name'] as String,
    userName: json['user_name'] as String,
    email: json['email'] as String,
    image: json['image'],
    phoneNumber: json['phone_number'] as String,
    userRole: json['user_role'] as String,
    isBlocked: json['is_blocked'] as bool,
    password: json['password'] as String?,
    old_password: json['old_password'] as String?,
    password_confirmation: json['password_confirmation'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.user_id,
      'id': instance.id,
      'user_name': instance.userName,
      'name': instance.name,
      'password': instance.password,
      'old_password': instance.old_password,
      'password_confirmation': instance.password_confirmation,
      'email': instance.email,
      'image': instance.image,
      'phone_number': instance.phoneNumber,
      'user_role': instance.userRole,
      'is_blocked': instance.isBlocked,
      'role': instance.role,
    };

ResponseLogin _$ResponseLoginFromJson(Map<String, dynamic> json) {
  return ResponseLogin(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    tokenType: json['token_type'] as String,
    expiresIn: json['expires_in'] as int,
    accessToken: json['access_token'] as String,
    expDate: json['exp_date'] as String,
  );
}

Map<String, dynamic> _$ResponseLoginToJson(ResponseLogin instance) =>
    <String, dynamic>{
      'user': instance.user,
      'access_token': instance.accessToken,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'exp_date': instance.expDate,
    };
