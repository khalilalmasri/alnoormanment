import 'package:alnoormanment/DAL/repository/price_currency/price_currency_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc.dart';

class PriceCurrencyBloc extends Bloc<PriceCurrencyEvent, PriceCurrencyState> {
  final PriceCurrencyRepository repository;

  PriceCurrencyBloc({required this.repository}) : super(InitialPriceCurrency());

  @override
  Stream<PriceCurrencyState> mapEventToState(PriceCurrencyEvent event) async* {

    if (event is LoadPriceData) {
      yield* _mapLoadPrice(event);
    }
    if (event is LoadCountDownloadData) {
      yield* _mapLoadCountDownload(event);
    }
    if (event is UpdatePriceCurrency) {
      yield* _mapUpdatePrice(event);
    }
  }


  Stream<PriceCurrencyState> _mapLoadPrice(LoadPriceData event) async* {
    yield PriceCurrencyLoading();

    try {

      var prices = await repository.getPrices();
      if (prices != null)
        ApiPriceCurrencyConstant.pricesCurrencyResponse = prices.listprice;
      var data = await repository.getTotalDownload();
      if (data != null)
        ApiPriceCurrencyConstant.countDownload = data.count;

      yield PriceCurrencyHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield PriceCurrencyNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
          yield PriceCurrencyNoInternetConnection();
      }
    }
  }

  Stream<PriceCurrencyState> _mapLoadCountDownload(LoadCountDownloadData event) async* {
    yield PriceCurrencyLoading();

    try {
      var data = await repository.getTotalDownload();
      if (data != null)
        ApiPriceCurrencyConstant.countDownload = data.count;

      yield PriceCurrencyHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield PriceCurrencyNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
          yield PriceCurrencyNoInternetConnection();
      }
    }
  }

  Stream<PriceCurrencyState> _mapUpdatePrice(UpdatePriceCurrency event) async* {
    yield PriceCurrencyLoading();

    try {
      var prices = await repository.updatePriceCurrency(event.listRequestCurrencyPrice);
      if (prices != null){
        ApiPriceCurrencyConstant.pricesCurrencyResponse = prices.listprice;

      }


      yield PriceCurrencyHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield PriceCurrencyNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
          yield PriceCurrencyNoInternetConnection();
      }
    }
  }
}
