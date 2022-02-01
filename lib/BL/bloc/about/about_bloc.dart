import 'package:alnoormanment/DAL/repository/about_us/about_us_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  final AboutRepository repository;

  AboutBloc({required this.repository}) : super(InitialPriceCurrency());

  @override
  Stream<AboutState> mapEventToState(AboutEvent event) async* {

    if (event is LoadAboutData) {
      yield* _mapLoadAbout(event);
    }
    if (event is UpdateAbout) {
      yield* _mapUpdateAbout(event);
    }
  }


  Stream<AboutState> _mapLoadAbout(LoadAboutData event) async* {
    yield AboutUsLoading();

    try {
      var data = await repository.getAbout();
      if (data != null)
        ApiPriceCurrencyConstant.aboutUs = data.aboutUs;

      yield AboutUsHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AboutUsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
          yield AboutUsNoInternetConnection();
      }
    }
  }

  Stream<AboutState> _mapUpdateAbout(UpdateAbout event) async* {
    yield AboutUsLoading();

    try {
      var data = await repository.updateAbout(event.aboutUs);
      if (data != null)
        ApiPriceCurrencyConstant.aboutUs = data.aboutUs;

      yield AboutUsHasData(hasUpdateAbout: true);
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield AboutUsNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
          yield AboutUsNoInternetConnection();
      }
    }
  }
}
