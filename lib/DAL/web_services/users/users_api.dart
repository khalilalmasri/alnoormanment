import 'package:alnoormanment/DAL/model/ads/ad_request.dart';
import 'package:alnoormanment/DAL/model/ads/ads.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/model/users/users_response.dart';
import 'package:alnoormanment/DAL/repository/ads/ads_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_constant.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'users_api.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class RequestUsers {
  factory RequestUsers(Dio dio, {String baseUrl}) = _RequestUsers;

  @GET("admin/user-manager")
  Future<UsersResponse> getUsers();

  @POST("admin/user-manager")
  Future<User> AddUser(@Body() User userRequest);

  @POST("admin/user-manager/update")
  Future<User> UpdatedUser(@Body() User userRequest);

  @POST("admin/user-manager/delete")
  Future<User> DeleteUser(@Body() User userRequest);

  @POST("/admin/user-manager/toggle-block")
  Future<User> ToggleBlockUser(@Body() User userRequest);
}
