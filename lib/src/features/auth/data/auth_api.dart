import 'dart:developer';

import 'package:dio/dio.dart';

class AuthApi {
  final Dio _dio;

  const AuthApi(this._dio);

  Future<Response?> login(String name, String password) async {
    try {
      final res = await _dio.post(
        'api/auth/login',
        data: {
          'name': name,
          'password': password,
        },
      );

      return res;
    } on DioException catch (e, st) {
      log(
        'login =====',
        time: DateTime.now(),
        name: 'AuthApi',
        error: e,
        stackTrace: st,
      );

      return e.response;
    } on Exception catch (e, st) {
      print('Error ===== ${e}');

      return null;
    }
  }

  Future<Response?> registration(String name, String password) async {
    try {
      final res = await _dio.post(
        'api/auth/registration',
        data: {
          'name': name,
          'password': password,
        },
      );

      return res;
    } on DioException catch (e, st) {
      log(
        'registration =====',
        time: DateTime.now(),
        name: 'AuthApi',
        error: e,
        stackTrace: st,
      );

      return e.response;
    } on Exception catch (e) {
      return null;
    }
  }

  Future<Response?> recoveryPass(String name) async {
    try {
      final res = await _dio.post(
        'api/auth/recoveryPass',
        data: {
          'name': name,
        },
      );

      return res;
    } on DioException catch (e, st) {
      log(
        'recoveryPass =====',
        time: DateTime.now(),
        name: 'AuthApi',
        error: e,
        stackTrace: st,
      );

      return e.response;
    } on Exception catch (e) {
      return null;
    }
  }
}
