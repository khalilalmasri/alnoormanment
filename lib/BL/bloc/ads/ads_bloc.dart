import 'package:alnoormanment/DAL/repository/ads/ads_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:alnoormanment/UI/ad/ads_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc.dart';

class AdsBloc extends Bloc<AdsEvent, AdsState> {
  final AdsRepository repository;

  AdsBloc({required this.repository}) : super(InitialAds());

  @override
  Stream<AdsState> mapEventToState(AdsEvent event) async* {
    if (event is LoadAdsData) {
      yield* _mapLoadAd(event);
    }
    if (event is UpdateAd) {
      yield* _mapUpdateAd(event);
    }
    if (event is AddAd) {
      yield* _mapAddAd(event);
    }
    if (event is DeleteAd) {
      yield* _mapDeleteAd(event);
    }
  }

  Stream<AdsState> _mapLoadAd(LoadAdsData event) async* {
    yield AdsLoading();

    try {
      var ads = await repository.getAds();
      if (ads != null) ApiPriceCurrencyConstant.AdsResponse = ads.listAds;

      yield AdsHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AdsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AdsNoInternetConnection();
      }
    }
  }

  Stream<AdsState> _mapUpdateAd(UpdateAd event) async* {
    yield AdsLoading();

    try {
      var data = await repository.UpdateAd(event.ad);
      if (data != null) {
        var ads = await repository.getAds();
        ApiPriceCurrencyConstant.AdsResponse = ads.listAds;
        yield AdsHasData(hasUpdateAd: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AdsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AdsNoInternetConnection();
      }
    }
  }

  Stream<AdsState> _mapAddAd(AddAd event) async* {
    yield AdsLoading();

    try {
      var data = await repository.AddAd(event.newAd);
      if (data != null) {
        var ads = await repository.getAds();
        ApiPriceCurrencyConstant.AdsResponse = ads.listAds;
        yield AdsHasData(hasSubmitAd: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AdsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AdsNoInternetConnection();
      }else {
        yield AdsError(
            e.response!.statusMessage.toString(),
            e.response!.statusCode,
            e.response!.data);
      }
    }
  }

  Stream<AdsState> _mapDeleteAd(DeleteAd event) async* {
    yield AdsLoading();

    try {
      var data = await repository.DeleteAd(event.existAd);
      if (data != null) {
        var ads = await repository.getAds();
        ApiPriceCurrencyConstant.AdsResponse = ads.listAds;
        yield AdsHasData(hasDeleteAd: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AdsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AdsNoInternetConnection();
      }
    }
  }
}
