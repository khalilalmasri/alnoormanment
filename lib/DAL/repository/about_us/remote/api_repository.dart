import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';
import 'package:alnoormanment/DAL/repository/about_us/about_us_repository.dart';
import 'package:alnoormanment/DAL/repository/price_currency/price_currency_repository.dart';
import 'package:alnoormanment/DAL/web_services/about_us/about_us_api.dart';
import 'package:alnoormanment/DAL/web_services/price_currency/price_currency_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository implements AboutRepository {
  Dio? _dio;
  RequestAboutUs? __requestAboutUs;

  ApiRepository() {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    __requestAboutUs = RequestAboutUs(_dio!);
  }

  addAuthenticationHeader() async {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));

    String? token = await StorageUtil.getString('token', defValue: '');

    _dio!.options.headers = <String, dynamic>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'authorization': "Bearer " + token!,
    };
    __requestAboutUs = RequestAboutUs(_dio!);
  }

  @override
  Future<AboutUsResponse> getAbout() async {
    await this.addAuthenticationHeader();
    return __requestAboutUs!.getAbout();
  }

  @override
  Future<AboutUsResponse> updateAbout(ValueAboutUs aboutUs) async {
    await this.addAuthenticationHeader();
    return __requestAboutUs!.updateAbout(aboutUs);
  }
}
