import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../../core.dart';
import 'dio_service_interceptors.dart';

class DioService extends DioForNative {
  DioService() {
    options.baseUrl = AppConsts.apiUrl;
    options.connectTimeout = const Duration(milliseconds: 8000);
    options.receiveTimeout = const Duration(milliseconds: 8000);
    options.sendTimeout = const Duration(milliseconds: 8000);

    options.responseType = ResponseType.json;

    interceptors.add(DioServiceInterceptors());
  }
}
