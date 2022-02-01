import 'package:alnoormanment/BL/bloc/authentication/auth_state.dart';
import 'package:alnoormanment/BL/exception/customer_exceptions.dart';
import 'package:alnoormanment/DAL/model/auth/auth_requests.dart';
import 'package:alnoormanment/DAL/repository/authentication/authentication_repository_impl.dart';
import 'package:alnoormanment/UI/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepositoryImpl repository;

  AuthenticationBloc({required this.repository})
      : super(InitialAuthentication());

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    // if (event is CheckCurrentUser) {
    //   yield AuthenticationNotAuthenticated();
    //   // yield* _mapCheckExistingUserToState(event);
    // }

    if (event is LoadLoginPage) {
      yield AuthenticationNotAuthenticated();
    }

    if (event is SubmitEmailFormLogin) {
      yield* _mapLoadAuthenticationToState(event);
    }
    if (event is LogoutEvent) {
      yield* _mapLoadLogoutToState(event);
    }
  }

  // Stream<AuthenticationState> _mapCheckExistingUserToState(
  //     CheckCurrentUser event) async* {
  //   try {
  //     yield AuthenticationLoading();
  //     var data = await repository.refresh();
  //     if (data.user == null) {
  //       yield NotAuthenticated(AppConstant.noData);
  //     } else if (ApiUserConstant.currentUser.userRole != "vendor") {
  //       throw new NoAcceptanceUserRoleException('User Role Not Accepted');
  //     } else if (!ApiUserConstant.currentUser.phoneNumberIsVerified) {
  //       dynamic isVerified = await Navigator.pushNamed(
  //           event.context, AppConstant.verifyPhoneNumberRoute);
  //
  //       if (isVerified)
  //         Navigator.pop(event.context, true);
  //       else
  //         yield NotVerified(AppConstant.notVerified);
  //     } else {
  //       Navigator.pop(event.context, true);
  //     }
  //   } on DioError catch (e) {
  //     if (e.response.statusCode == 401) {
  //       yield NotAuthenticated(AppConstant.noData);
  //     } else if (e.type == DioErrorType.CONNECT_TIMEOUT ||
  //         e.type == DioErrorType.RECEIVE_TIMEOUT) {
  //       yield AuthenticationNoInternetConnection();
  //     } else if (e.type == DioErrorType.DEFAULT) {
  //       yield AuthenticationNoInternetConnection();
  //     } else {
  //       yield AuthenticationError(e.toString());
  //     }
  //   } on NoAcceptanceUserRoleException catch (e) {
  //     yield UserRoleNotAccepted(e.toString());
  //   }
  // }

  Stream<AuthenticationState> _mapLoadAuthenticationToState(
      SubmitEmailFormLogin event) async* {
    yield AuthenticationLoading();
    try {
      var data = await repository.loginWithEmail(AuthenticationFormLogin(
          userName: event.userName, password: event.password));

      if (data.responseLogin == null)
        yield AuthenticationNotAuthenticated();
      else {
        if (data.responseLogin.user.userRole == "AD" ||
            data.responseLogin.user.userRole == "AC")
          Navigator.pushReplacementNamed(event.context, HomeScreen.routeName);
        else
          yield AuthenticationNotAuthenticated();
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        yield AuthenticationNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AuthenticationError(e.toString());
      } else {
        yield AuthenticationError(e.toString());
      }
    } on NoAcceptanceUserRoleException catch (e) {
      yield UserRoleNotAccepted(e.toString());
    }
  }

  Stream<AuthenticationState> _mapLoadLogoutToState(LogoutEvent event) async* {
    yield AuthenticationLoading();
    try {
      await repository.logout();

      yield AuthenticationNotAuthenticated();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        yield AuthenticationNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield AuthenticationError(e.toString());
      } else {
        yield AuthenticationError(e.toString());
      }
    } on NoAcceptanceUserRoleException catch (e) {
      yield UserRoleNotAccepted(e.toString());
    }
  }
}
