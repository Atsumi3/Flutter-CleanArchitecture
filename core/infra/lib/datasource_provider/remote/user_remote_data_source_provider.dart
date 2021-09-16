import 'package:riverpod/riverpod.dart';

import '../../datasource/remote/user_remote_data_source.dart';
import '../../datasource_impl/remote/user_remote_data_source_impl.dart';

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>(
  (ref) => UserRemoteDataSourceImpl(),
);
