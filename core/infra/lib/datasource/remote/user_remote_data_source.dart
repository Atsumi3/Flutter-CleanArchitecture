import 'model/remote_user.dart';

abstract class UserRemoteDataSource {
  Future<RemoteUser> login();
  Future<void> logout();
}
