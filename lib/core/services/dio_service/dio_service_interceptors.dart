// ignore_for_file: unnecessary_overrides, avoid_print

import 'package:dio/dio.dart';

class DioServiceInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"Content-Type": "application/json"});

    //  print('REQUEST[${options.method}] => PATH: ${options.path}');
    //  print('BASE_URL: [${options.baseUrl}] => PATH: ${options.path}');
    //  print('PARAMETERS: [${options.queryParameters}]');
    //  print('BODY: [${options.data}]');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    //print(
    //    'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    //print('RESPONSE.DATA[${response.data}]');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    print('ERROR_DATA => DATA: [${err.response?.data.toString()}]');

    super.onError(err, handler);
  }
}
