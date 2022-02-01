import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class InitialAds extends UsersState {}

class UsersLoading extends UsersState {}

class UsersHasData extends UsersState {
  bool hasSubmitUser;
  bool hasUpdateUser;
  bool hasDeleteUser;

  UsersHasData(
      {this.hasSubmitUser = false,
      this.hasDeleteUser = false,
      this.hasUpdateUser = false});

  @override
  List<Object> get props => [];
}

class UsersNoData extends UsersState {
  final String message;

  const UsersNoData(this.message);

  @override
  List<Object> get props => [message];
}

class UsersNoInternetConnection extends UsersState {}

class UsersError extends UsersState {
  final String errorMessage;
  final int? statusCode;
  final dynamic errors;

  UsersError(this.errorMessage, this.statusCode, this.errors);

  @override
  List<Object> get props => [errorMessage];
}
