import 'package:dio/dio.dart';

import 'error_interceptor.dart';
import 'on_request_interceptor.dart';

class ApiClient {
  final Dio dio = Dio();

  static const String _api = 'http://localhost:3020/';

  ApiClient() {
    dio.options.baseUrl = _api;

    dio.interceptors.addAll([
      OnError(),
      OnRequest(),
    ]);
  }
}
