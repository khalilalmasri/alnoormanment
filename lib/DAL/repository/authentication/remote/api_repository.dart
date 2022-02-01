import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/auth/auth_requests.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/web_services/authentication/rest_auth.dart';
import 'package:dio/dio.dart';
import '../authentication_repository.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'dart:developer';

class ApiRepository implements AuthRepository {
  Dio? _dio;
  RestAuth? _restAuth;

  ApiRepository() {
    _dio = Dio();
    _dio!.options.headers = <String, dynamic>{
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    _dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: true,
    ));
    _restAuth = RestAuth(_dio!);
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
    _restAuth = RestAuth(_dio!);
  }


  @override
  Future<ResultUser> isAuth() async {
    await this.addAuthenticationHeader();
    return _restAuth!.isAuth();
  }

  @override
  Future<ResultUser> refresh() async {
    await this.addAuthenticationHeader();
    return _restAuth!.refresh();
  }


  @override
  Future<ResultUser> loginWithEmail(AuthenticationFormLogin registration) async {
    return await _restAuth!.loginEmailAndPassword(registration);
  }

  @override
  Future<void> logout() async{
    await this.addAuthenticationHeader();
    return _restAuth!.logout();
  }
}
