import 'dart:async';

import 'package:layerbit_oraculum_flutter/src/features/auth/data/auth_repository.dart';
import 'package:layerbit_oraculum_flutter/src/features/auth/domain/models/auth_model.dart';
import 'package:layerbit_oraculum_flutter/src/features/user_data/domain/user_data_service.dart';

class AuthService {
  final AuthRepository _authRepository;
  final UserDataService _userDataService;

  AuthService(
    this._authRepository,
    this._userDataService,
  );

  final StreamController<bool> _authStreamController = StreamController<bool>();
  final StreamController<String> _registrationStreamController = StreamController<String>();

  Stream<bool> get authState => _authStreamController.stream;
  StreamSink<bool> get authSink => _authStreamController.sink;

  Stream<String> get registrationState => _registrationStreamController.stream;
  StreamSink<String> get registrationSink => _registrationStreamController.sink;

  Future<void> logoOut() async {
    await _userDataService.setLoggedIn(false);

    _authStreamController.add(false);
  }

  Future<AuthModel> signIn(
    String name,
    String password,
  ) async {
    return await authOnBackend(name, password);
  }

  Future<AuthModel> registration(
    String name,
    String password,
  ) async {
    return await registrationOnBackend(name, password);
  }

  Future<AuthModel> authOnBackend(String name, String password) async {
    final authModel = await _authRepository.login(name, password);

    if (authModel.statusCode == 200) {
      await _userDataService.setLoggedIn(true);
      _authStreamController.add(true);

      return authModel;
    } else {
      return authModel;
    }
  }

  Future<AuthModel> registrationOnBackend(String name, String password) async {
    final authModel = await _authRepository.registration(name, password);

    if (authModel.statusCode == 200) {
      registrationSink.add('Регистрация успешно завершена.');

      return authModel;
    } else {
      return authModel;
    }
  }

  bool userLoggedIn() {
    return _userDataService.isLoggedIn();
  }

  Future<AuthModel> recoveryPass(String name) async {
    final authModel = await _authRepository.recoveryPass(name);

    return authModel;
  }

  void dispose() {
    _authStreamController.close();
    _registrationStreamController.close();
  }
}
