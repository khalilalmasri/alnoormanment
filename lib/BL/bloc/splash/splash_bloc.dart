import 'package:alnoormanment/BL/storage/local_data_shared_preference.dart';
import 'package:alnoormanment/DAL/repository/authentication/authentication_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_user_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository repository;

  SplashBloc({required this.repository}) : super(InitialSplash());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is LoadSplashData) {
      yield* _mapLoadSplashToState();
    }
  }

  Stream<SplashState> _mapLoadSplashToState() async* {
    yield SplashLoading();
    try {
      String? token = await StorageUtil.getString('token', defValue: '');

      if (token!.isNotEmpty&&token != null) {
        var data = await repository.refresh();
        if (data != null) {
          ApiUserConstant.responseLogin = data.responseLogin;
          ApiUserConstant.currentUser = data.responseLogin.user;
        }
        if (ApiUserConstant.currentUser != null) {
          yield SplashHasData(ApiUserConstant.currentUser!);
        } else {
          yield SplashNotAuthenticated();
        }
      } else {
        yield SplashNotAuthenticated();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield SplashNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield SplashNoInternetConnection();
      } else {
        yield SplashNotAuthenticated();
        // yield SplashError(e.toString());
      }
    }
  }
}
