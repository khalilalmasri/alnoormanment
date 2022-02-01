import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:equatable/equatable.dart';

abstract class SplashState extends Equatable {
  const SplashState();

  @override
  List<Object> get props => [];
}

class InitialSplash extends SplashState {}

class SplashLoading extends SplashState {}

class SplashHasData extends SplashState {
final User user;

  const SplashHasData(this.user);

  @override
  List<Object> get props => [user];
}

class SplashNoData extends SplashState {
  final String message;

  const SplashNoData(this.message);

  @override
  List<Object> get props => [message];
}

class SplashNoInternetConnection extends SplashState {}

class SplashError extends SplashState {
  final String errorMessage;

  SplashError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}


class SplashNotAuthenticated extends SplashState {}