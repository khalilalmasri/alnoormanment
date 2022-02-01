import 'package:alnoormanment/DAL/model/auth/auth_requests.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_auth.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RestAuth {
  factory RestAuth(Dio dio, {String baseUrl}) = _RestAuth;

  @POST("auth/login")
  Future<ResultUser> loginEmailAndPassword(
      @Body() AuthenticationFormLogin login);

  @GET("auth/me")
  Future<ResultUser> isAuth();

  @POST("auth/refresh")
  Future<ResultUser> refresh();


  @POST("auth/logout")
  Future<void> logout();
}
