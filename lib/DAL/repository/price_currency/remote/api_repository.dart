import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/price_currency/count_download.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';
import 'package:alnoormanment/DAL/repository/price_currency/price_currency_repository.dart';
import 'package:alnoormanment/DAL/web_services/price_currency/price_currency_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository implements PriceCurrencyRepository {
  Dio? _dio;
  RequestPriceCurrency? __requestPriceCurrency;

  ApiRepository() {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    __requestPriceCurrency = RequestPriceCurrency(_dio!);
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
    __requestPriceCurrency = RequestPriceCurrency(_dio!);
  }

  @override
  Future<ListItemsPriceCurrency> getPrices() async {
    await this.addAuthenticationHeader();
    return __requestPriceCurrency!.getPrices();
  }

  @override
  Future<ListItemsPriceCurrency> updatePriceCurrency(
      ListRequestCurrencyPrice pricesCurrency) async {
    await this.addAuthenticationHeader();
    return __requestPriceCurrency!.updatePriceCurrency(pricesCurrency);
  }

  @override
  Future<CountDownloadResponse> getTotalDownload() async{
    await this.addAuthenticationHeader();
    return __requestPriceCurrency!.getTotalDownload();
  }
}
