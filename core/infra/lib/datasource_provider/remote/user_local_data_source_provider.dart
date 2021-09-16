import 'package:riverpod/riverpod.dart';

import '../../datasource/local/user_local_data_source.dart';
import '../../datasource_impl/local/user_local_data_source_impl.dart';

final userLocalDataSourceProvider = Provider<UserLocalDataSource>(
  (ref) => UserLocalDataSourceImpl(),
);
