import 'package:advance_flutter/network_layer/constant/http_request_type.dart';
import 'package:dio/dio.dart';

abstract class ICoreDio {
  Future<R> fetch<R, T>(
      {required String path,
      required dynamic data,
      required HttpRequestType requestType,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress});
}
