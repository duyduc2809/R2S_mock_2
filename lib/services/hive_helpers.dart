import 'package:hive_flutter/adapters.dart';

import '../models/user.dart';

class HiveHelper {
  late var box;

  Future<void> openBox() async {
    box = await Hive.openBox('userData');
  }

  Future<void> saveData(User user, String token, bool rememberMe) async {
    await openBox();
    box.put('user', user);
    box.put('token', token);
    box.put('rememberMe', rememberMe);
  }

  Future<User> loadUserData() async {
    await openBox();
    return box.get('user') as User;
  }

  Future<String> loadUserToken() async {
    await openBox();
    return box.get('token') as String;
  }

  Future<bool> loadRememberMe() async {
    await openBox();
    return box.get('rememberMe') as bool;
  }

  Future<void> deleteSavedData() async {
    await openBox();
    box.delete('user');
    box.delete('token');
    box.delete('rememberMe');
    box.close();
  }
}
