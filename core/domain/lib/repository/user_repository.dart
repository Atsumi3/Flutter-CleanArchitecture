import '../entity/user.dart';

abstract class UserRepository {
  Future<User?> loadLoggedInUser();
  Future<User> login();
  Future<void> logout();
}
