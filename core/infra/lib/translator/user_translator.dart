import 'package:domain/entity/user.dart';

import '../datasource/local/model/local_user.dart';
import '../datasource/remote/model/remote_user.dart';

extension UserTranslator on User {
  static User fromRemoteUser(RemoteUser remoteUser) =>
      User(name: remoteUser.name);

  static User fromLocalUser(LocalUser localUser) => User(name: localUser.name);

  LocalUser get toLocalUser => LocalUser(name: name);
}
