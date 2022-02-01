import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse extends Equatable {
  UsersResponse({
    required this.data,
  });

  @JsonKey(name: 'data')
  final List<User> data;

  factory UsersResponse.fromJson(Map<String, dynamic> json) =>
      _$UsersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);

  @override
  List<Object> get props => [data];
}
