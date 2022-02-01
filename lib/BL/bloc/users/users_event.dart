import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsersData extends UsersEvent {}

class UpdateUser extends UsersEvent {
  final User user;
  final BuildContext context;

  UpdateUser({required this.user, required this.context});
}

class AddUser extends UsersEvent {
  final User newUser;
  final BuildContext context;

  AddUser({required this.newUser, required this.context});
}

class DeleteUser extends UsersEvent {
  final User existUser;
  final BuildContext context;

  DeleteUser({required this.existUser, required this.context});
}

class ToggleBlockUser extends UsersEvent {
  final User userBlocked;


  ToggleBlockUser({required this.userBlocked});
}
