import 'package:equatable/equatable.dart';

abstract class AboutState extends Equatable {
  const AboutState();

  @override
  List<Object> get props => [];
}

class InitialPriceCurrency extends AboutState {}

class AboutUsLoading extends AboutState {}

class AboutUsHasData extends AboutState {
  bool hasUpdateAbout;

   AboutUsHasData({this.hasUpdateAbout = false});

  @override
  List<Object> get props => [];
}

class AboutUsNoData extends AboutState {
  final String message;

  const AboutUsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class AboutUsNoInternetConnection extends AboutState {}


class AboutUsError extends AboutState {
  final String errorMessage;

  AboutUsError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

