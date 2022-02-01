import 'package:alnoormanment/DAL/model/auth/user.dart';
import 'package:alnoormanment/DAL/model/users/users_response.dart';

abstract class UsersRepository {
  Future<UsersResponse> getUsers();

  Future<User> UpdateUser(User userRequest);

  Future<User> AddUser(User userRequest);

  Future<User> DeleteUser(User userRequest);

  Future<User> ToggleBlockUser(User userRequest);
}
