import '../../datasource/remote/model/remote_user.dart';
import '../../datasource/remote/user_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<RemoteUser> login() async {
    return RemoteUser.fromJson({"name": "Smith"});
  }

  @override
  Future<void> logout() async {
    /// いい感じのログアウトリクエスト
    return Future.value();
  }
}
