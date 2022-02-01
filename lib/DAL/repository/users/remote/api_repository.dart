import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/model/users/users_response.dart';
import 'package:alnoormanment/DAL/repository/users/users_repository.dart';
import 'package:alnoormanment/DAL/web_services/users/users_api.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiRepository implements UsersRepository {
  Dio? _dio;
  RequestUsers? __requestUsers;

  ApiRepository() {
    _dio = Dio();
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    __requestUsers = RequestUsers(_dio!);
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
    __requestUsers = RequestUsers(_dio!);
  }

  @override
  Future<UsersResponse> getUsers() async {
    await this.addAuthenticationHeader();
    return __requestUsers!.getUsers();
  }

  @override
  Future<User> AddUser(User userRequest) async {
    await this.addAuthenticationHeader();
    return __requestUsers!.AddUser(userRequest);
  }

  @override
  Future<User> UpdateUser(User userRequest) async {
    await this.addAuthenticationHeader();
    return __requestUsers!.UpdatedUser(userRequest);
  }

  @override
  Future<User> DeleteUser(User userRequest) async {
    await this.addAuthenticationHeader();
    return __requestUsers!.DeleteUser(userRequest);
  }

  @override
  Future<User> ToggleBlockUser(User userRequest)async {
    await this.addAuthenticationHeader();
    return __requestUsers!.ToggleBlockUser(userRequest);
  }
}
