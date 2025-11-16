import 'package:layerbit_oraculum_flutter/src/features/common/shared_pref/shared_pref.dart';

import 'models/user_data_response_model.dart';


class UserDataStorage {
  final SharedPref _sharedPref;
  final _userData = 'userData';

  UserDataStorage(
    this._sharedPref,
  );

  Future<UserDataResponse> getUserData() async {
    final value = UserDataResponse(name: '', token: '');

    return value;
  }

  Future<void> saveUserData(UserDataResponse userData) async {}

  Future<void> clear() async {}

  void saveUserPassword(String password) {
    _sharedPref.setString('user_password', password);
  }

  Future<String?> getUserPassword() async {
    final pass = await _sharedPref.getString('user_password');

    return pass ?? '';
  }

  Future<void> setLoggedIn(bool value) async {
    await _sharedPref.setBool('login_user', value);
  }

  bool isLoggedIn() {
    final isLoggedIn = _sharedPref.getBool('login_user');

    if (isLoggedIn != null) {
      return isLoggedIn;
    } else {
      return false;
    }
  }
}
