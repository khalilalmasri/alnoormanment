import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class InitialAuthentication extends AuthenticationState {}


class AuthenticationLoading extends AuthenticationState {}

class AdminAuthenticated extends AuthenticationState {
  User user;

  AdminAuthenticated({ required this.user});

  @override
  List<Object> get props => [user];
}

class FieldStaffAuthenticated extends AuthenticationState {
  User user;

  FieldStaffAuthenticated({ required this.user});

  @override
  List<Object> get props => [user];
}


class AuthenticationBlocked extends AuthenticationState {
  final String message;

  const AuthenticationBlocked(this.message);

  @override
  List<Object> get props => [message];
}


class AuthenticationNotAuthenticated extends AuthenticationState {

}

class UserRoleNotAccepted extends AuthenticationState {
  final String errorMessage;

  const UserRoleNotAccepted(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationNoInternetConnection extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String errorMessage;

  AuthenticationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
