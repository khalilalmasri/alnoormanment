import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'ads_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RequestAds {
  factory RequestAds(Dio dio, {String baseUrl}) = _RequestAds;

  @GET("admin/ads-manager")
  Future<ListItemsAds> getAds();

  @POST("admin/ads-manager")
  Future<AdRequest> AddAd(@Body() AdRequest adRequest);

  @POST("admin/ads-manager/update")
  Future<AdRequest> UpdatedAd(@Body() AdRequest adRequest);

  @POST("admin/ads-manager/delete")
  Future<AdRequest> DeleteAd(@Body() AdRequest adRequest);
}
