import 'package:alnoormanment/DAL/model/price_currency/count_download.dart';
import 'package:alnoormanment/DAL/model/price_currency/request_price_currency.dart';
import 'package:alnoormanment/DAL/model/price_currency/response_price_currency.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'price_currency_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RequestPriceCurrency {
  factory RequestPriceCurrency(Dio dio, {String baseUrl}) =
      _RequestPriceCurrency;

  @GET("admin/currency-price/active")
  Future<ListItemsPriceCurrency> getPrices();

  @GET("admin/currency-price/count-download")
  Future<CountDownloadResponse> getTotalDownload();

  @POST("admin/currency-price/update")
  Future<ListItemsPriceCurrency> updatePriceCurrency(
      @Body() ListRequestCurrencyPrice pricesCurrency);
}
