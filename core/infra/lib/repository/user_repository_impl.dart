import 'package:domain/entity/user.dart';
import 'package:domain/repository/user_repository.dart';
import 'package:infra/datasource/local/user_local_data_source.dart';

import '../datasource/remote/user_remote_data_source.dart';
import '../translator/user_translator.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;

  UserRepositoryImpl({
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });

  @override
  Future<User> login() async {
    final remoteUser = await userRemoteDataSource.login();
    final user = UserTranslator.fromRemoteUser(remoteUser);
    await userLocalDataSource.saveUser(user);
    return user;
  }

  @override
  Future<void> logout() async {
    await userRemoteDataSource.logout();
    await userLocalDataSource.deleteUser();
  }

  @override
  Future<User?> loadLoggedInUser() async {
    final localUser = await userLocalDataSource.loadUser();
    if (localUser == null) {
      return null;
    }
    return UserTranslator.fromLocalUser(localUser);
  }
}
