import 'package:equatable/equatable.dart';

abstract class PriceCurrencyState extends Equatable {
  const PriceCurrencyState();

  @override
  List<Object> get props => [];
}

class InitialPriceCurrency extends PriceCurrencyState {}

class PriceCurrencyLoading extends PriceCurrencyState {}


class PriceCurrencyHasData extends PriceCurrencyState {


  const PriceCurrencyHasData();

  @override
  List<Object> get props => [];
}

class PriceCurrencyNoData extends PriceCurrencyState {
  final String message;

  const PriceCurrencyNoData(this.message);

  @override
  List<Object> get props => [message];
}

class PriceCurrencyNoInternetConnection extends PriceCurrencyState {}


class PriceCurrencyError extends PriceCurrencyState {
  final String errorMessage;

  PriceCurrencyError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

