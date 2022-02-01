import 'package:alnoormanment/DAL/model/auth/auth_requests.dart';
import 'package:alnoormanment/DAL/model/auth/user.dart';


abstract class AuthRepository {
  Future<ResultUser> loginWithEmail(
      AuthenticationFormLogin registration);

  Future<ResultUser> isAuth();

  Future<ResultUser> refresh();


  Future<void> logout();
}
