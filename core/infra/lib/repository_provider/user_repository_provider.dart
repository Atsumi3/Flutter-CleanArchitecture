import 'package:domain/repository/user_repository.dart';
import 'package:riverpod/riverpod.dart';

import '../datasource_provider/remote/user_local_data_source_provider.dart';
import '../datasource_provider/remote/user_remote_data_source_provider.dart';
import '../repository/user_repository_impl.dart';

final userRepositoryProvider = Provider<UserRepository>(
  (ref) => UserRepositoryImpl(
    userRemoteDataSource: ref.read(userRemoteDataSourceProvider),
    userLocalDataSource: ref.read(userLocalDataSourceProvider),
  ),
);
