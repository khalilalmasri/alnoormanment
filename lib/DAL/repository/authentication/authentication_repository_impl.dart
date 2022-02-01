import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/model/auth/auth_requests.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/web_services/api_user_constant.dart';

import './remote/api_repository.dart';
import './authentication_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiRepository apiRepository;

  static final AuthRepositoryImpl _singleton =
      AuthRepositoryImpl._internal(apiRepository: ApiRepository());

  factory AuthRepositoryImpl() {
    return _singleton;
  }

  AuthRepositoryImpl._internal({required this.apiRepository});

  @override
  Future<ResultUser> loginWithEmail(
      AuthenticationFormLogin registration) async {
    var data = await apiRepository.loginWithEmail(registration);

    ApiUserConstant.currentUser = data.responseLogin.user;
    ApiUserConstant.responseLogin = data.responseLogin;
    ApiUserConstant.token = data.responseLogin.accessToken;

    await StorageUtil.setString('token', ApiUserConstant.token);

    return data;
  }

  @override
  Future<ResultUser> isAuth() async {
    if (ApiUserConstant.currentUser != null)
      return Future.value(
          ResultUser(responseLogin: ApiUserConstant.responseLogin!));

    var data = await apiRepository.isAuth();
    ApiUserConstant.currentUser = data.responseLogin.user;
    ApiUserConstant.responseLogin = data.responseLogin;
    ApiUserConstant.token = data.responseLogin.accessToken;

    return data;
  }

  @override
  Future<ResultUser> refresh() async {
    var data = await apiRepository.refresh();
    ApiUserConstant.currentUser = data.responseLogin.user;
    ApiUserConstant.responseLogin = data.responseLogin;
    ApiUserConstant.token = ApiUserConstant.responseLogin!.accessToken;

    await StorageUtil.setString('token', ApiUserConstant.token);
    return data;
  }

  @override
  Future<void> logout() async {
    await apiRepository.logout();
    ApiUserConstant.currentUser = null;
    ApiUserConstant.token = '';
    await StorageUtil.setString('token', '');
  }
}
