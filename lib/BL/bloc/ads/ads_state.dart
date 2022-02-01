import 'package:equatable/equatable.dart';

abstract class AdsState extends Equatable {
  const AdsState();

  @override
  List<Object> get props => [];
}

class InitialAds extends AdsState {}

class AdsLoading extends AdsState {}

class AdsHasData extends AdsState {
  bool hasSubmitAd;
  bool hasUpdateAd;
  bool hasDeleteAd;

  AdsHasData(
      {this.hasSubmitAd = false,
      this.hasDeleteAd = false,
      this.hasUpdateAd = false});

  @override
  List<Object> get props => [];
}

class AdsNoData extends AdsState {
  final String message;

  const AdsNoData(this.message);

  @override
  List<Object> get props => [message];
}

class AdsNoInternetConnection extends AdsState {}

class AdsError extends AdsState {
  final String errorMessage;
  final int? statusCode;
  final dynamic errors;

  AdsError(this.errorMessage, this.statusCode, this.errors);

  @override
  List<Object> get props => [errorMessage];
}
