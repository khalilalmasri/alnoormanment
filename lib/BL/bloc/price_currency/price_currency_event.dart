import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:equatable/equatable.dart';

abstract class PriceCurrencyEvent extends Equatable {
  const PriceCurrencyEvent();

  @override
  List<Object> get props => [];
}

class LoadPriceData extends PriceCurrencyEvent {}

class LoadCountDownloadData extends PriceCurrencyEvent {}

class UpdatePriceCurrency extends PriceCurrencyEvent {

  final ListRequestCurrencyPrice listRequestCurrencyPrice;

  UpdatePriceCurrency({required this.listRequestCurrencyPrice});

}
