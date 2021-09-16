import 'dart:convert';

import 'package:domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../datasource/local/model/local_user.dart';
import '../../datasource/local/user_local_data_source.dart';
import '../../translator/user_translator.dart';

class UserLocalDataSourceImpl implements UserLocalDataSource {
  static const _preferenceKeyUser = "user";

  @override
  Future<void> deleteUser() async {
    final preference = await SharedPreferences.getInstance();
    await preference.remove(_preferenceKeyUser);
  }

  @override
  Future<LocalUser?> loadUser() async {
    final preference = await SharedPreferences.getInstance();
    final userJson = preference.getString(_preferenceKeyUser);
    if (userJson == null) {
      return null;
    }
    return LocalUser.fromJson(json.decode(userJson));
  }

  @override
  Future<void> saveUser(User user) async {
    final preference = await SharedPreferences.getInstance();
    final userJsonMap = user.toLocalUser.toJson();
    await preference.setString(_preferenceKeyUser, json.encode(userJsonMap));
  }
}
