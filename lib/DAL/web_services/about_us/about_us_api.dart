import 'package:alnoormanment/DAL/model/about_us/about_us.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'about_us_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RequestAboutUs {
  factory RequestAboutUs(Dio dio, {String baseUrl}) = _RequestAboutUs;

  @GET("manager/company-info")
  Future<AboutUsResponse> getAbout();

  @POST("manager/company_info")
  Future<AboutUsResponse> updateAbout(@Body() ValueAboutUs aboutUs);
}
