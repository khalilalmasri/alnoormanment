import 'package:alnoormanment/DAL/repository/users/users_repository.dart';
import 'package:alnoormanment/DAL/web_services/api_price_currency_constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository repository;

  UsersBloc({required this.repository}) : super(InitialAds());

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async* {
    if (event is LoadUsersData) {
      yield* _mapLoadUser(event);
    }
    if (event is UpdateUser) {
      yield* _mapUpdateUser(event);
    }
    if (event is AddUser) {
      yield* _mapAddUser(event);
    }
    if (event is DeleteUser) {
      yield* _mapDeleteUser(event);
    }
    if (event is ToggleBlockUser) {
      yield* _mapToggleBlockUser(event);
    }
  }

  Stream<UsersState> _mapLoadUser(LoadUsersData event) async* {
    yield UsersLoading();

    try {
      var users = await repository.getUsers();

      if (users != null) ApiPriceCurrencyConstant.usersResponse = users.data;

      yield UsersHasData();
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield UsersNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield UsersNoInternetConnection();
      }
    }
  }

  Stream<UsersState> _mapUpdateUser(UpdateUser event) async* {
    yield UsersLoading();

    try {
      var data = await repository.UpdateUser(event.user);
      if (data != null) {
        var users = await repository.getUsers();
        ApiPriceCurrencyConstant.usersResponse = users.data;
        yield UsersHasData(hasUpdateUser: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield UsersNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield UsersNoInternetConnection();
      }
    }
  }

  Stream<UsersState> _mapAddUser(AddUser event) async* {
    yield UsersLoading();

    try {
      var data = await repository.AddUser(event.newUser);
      if (data != null) {
        var users = await repository.getUsers();
        ApiPriceCurrencyConstant.usersResponse = users.data;
        yield UsersHasData(hasSubmitUser: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield UsersNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield UsersNoInternetConnection();
      } else {
        yield UsersError(e.response!.statusMessage.toString(),
            e.response!.statusCode, e.response!.data);
      }
    }
  }

  Stream<UsersState> _mapDeleteUser(DeleteUser event) async* {
    yield UsersLoading();

    try {
      var data = await repository.DeleteUser(event.existUser);
      if (data != null) {
        var users = await repository.getUsers();
        ApiPriceCurrencyConstant.usersResponse = users.data;
        yield UsersHasData(hasDeleteUser: true);
        Navigator.pop(event.context);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield UsersNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield UsersNoInternetConnection();
      }
    }
  }

  Stream<UsersState> _mapToggleBlockUser(ToggleBlockUser event) async* {
    yield UsersLoading();

    try {
      var data = await repository.ToggleBlockUser(event.userBlocked);
      if (data != null) {
        var users = await repository.getUsers();
        ApiPriceCurrencyConstant.usersResponse = users.data;
        yield UsersHasData(hasUpdateUser: true);

      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        yield UsersNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        yield UsersNoInternetConnection();
      }
    }
  }
}
