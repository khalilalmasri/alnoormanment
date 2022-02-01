import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoadLoginPage extends AuthenticationEvent {
  LoadLoginPage();

  @override
  List<Object> get props => [];
}

class LogoutEvent extends AuthenticationEvent {}

class CheckCurrentUser extends AuthenticationEvent {
  final BuildContext context;

  CheckCurrentUser({required this.context});

  @override
  List<Object> get props => [];
}

class SubmitEmailFormLogin extends AuthenticationEvent {
  final String userName;
  final String password;
  final BuildContext context;

  SubmitEmailFormLogin(
      {required this.userName, required this.password, required this.context});

  @override
  List<Object> get props => [userName, password, context];
}
