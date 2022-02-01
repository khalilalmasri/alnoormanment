import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/model/users/users_response.dart';
import 'package:alnoormanment/DAL/repository/users/users_repository.dart';
import 'remote/api_repository.dart';

class UserRepositoryImpl extends UsersRepository {
  final ApiRepository apiRepository;

  static final UserRepositoryImpl _singleton =
      UserRepositoryImpl._internal(apiRepository: ApiRepository());

  factory UserRepositoryImpl() {
    return _singleton;
  }

  UserRepositoryImpl._internal({required this.apiRepository});

  @override
  Future<UsersResponse> getUsers() async {
    return await apiRepository.getUsers();
  }

  @override
  Future<User> AddUser(User userRequest) async {
    return await apiRepository.AddUser(userRequest);
  }

  @override
  Future<User> UpdateUser(User userRequest) async {
    return await apiRepository.UpdateUser(userRequest);
  }

  @override
  Future<User> DeleteUser(User userRequest) async {
    return await apiRepository.DeleteUser(userRequest);
  }

  @override
  Future<User> ToggleBlockUser(User userRequest) async {
    return await apiRepository.ToggleBlockUser(userRequest);
  }
}
