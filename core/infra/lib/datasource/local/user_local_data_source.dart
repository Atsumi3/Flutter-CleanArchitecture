import 'package:domain/entity/user.dart';

import 'model/local_user.dart';

abstract class UserLocalDataSource {
  Future<LocalUser?> loadUser();
  Future<void> saveUser(User user);
  Future<void> deleteUser();
}
