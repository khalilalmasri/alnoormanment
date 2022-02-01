import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'auth_requests.g.dart';


@JsonSerializable()
class AuthenticationFormLogin extends Equatable {
  AuthenticationFormLogin({required this.userName, required this.password});

  @JsonKey(name: 'user_name')
  final String userName;

  @JsonKey(name: 'password')
  final String password;

  @override
  List<Object> get props => [userName, password];


  Map<String, dynamic> toJson() => _$AuthenticationFormLoginToJson(this);
}
