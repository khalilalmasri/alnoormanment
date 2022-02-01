import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ResultUser extends Equatable {
  @JsonKey(name: 'data')
  final ResponseLogin responseLogin;

  const ResultUser({
    required this.responseLogin,
  });

  @override
  List<Object> get props => [responseLogin];

  factory ResultUser.fromJson(Map<String, dynamic> json) =>
      _$ResultUserFromJson(json);
}

@JsonSerializable(nullable: true)
class User extends Equatable {
  User({
    this.role = 'AD',
    required this.id,
    this.user_id,
    required this.name,
    required this.userName,
    required this.email,
    this.image,
    required this.phoneNumber,
    required this.userRole,
    this.isBlocked = false,
    this.password,
    this.old_password,
    this.password_confirmation,
  });

  @JsonKey(name: 'user_id')
  final int? user_id;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'password')
  final String? password;

  @JsonKey(name: 'old_password')
  final String? old_password;

  @JsonKey(name: 'password_confirmation')
  final String? password_confirmation;

  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'image')
  final dynamic image;

  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @JsonKey(name: 'user_role')
  final String userRole;

  @JsonKey(name: 'is_blocked')
   bool isBlocked;

  @JsonKey(name: 'role')
  final String? role;

  @override
  List<Object?> get props =>
      [id, name, email, phoneNumber, userRole, image, isBlocked, role, user_id];

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(nullable: true)
class ResponseLogin extends Equatable {
  ResponseLogin({
    required this.user,
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
    required this.expDate,
  });

  @JsonKey(name: 'user')
  final User user;

  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'token_type')
  final String tokenType;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @JsonKey(name: 'exp_date')
  final String expDate;

  @override
  List<Object> get props => [
        accessToken,
        tokenType,
        expiresIn,
        expDate,
      ];

  factory ResponseLogin.fromJson(Map<String, dynamic> json) =>
      _$ResponseLoginFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseLoginToJson(this);
}
