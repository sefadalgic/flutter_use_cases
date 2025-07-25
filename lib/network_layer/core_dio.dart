import 'dart:io';

import 'package:advance_flutter/network_layer/ICoreDio.dart';
import 'package:advance_flutter/network_layer/constant/http_request_type.dart';
import 'package:dio/dio.dart';

class CoreDio with DioMixin implements Dio, ICoreDio {
  Future<R> fetch<R, T>(
      {required String path,
      required dynamic data,
      required HttpRequestType requestType,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    
    final response = await request(path,
        data: data,
        options: Options(
          method: requestType.value,
        ));


        switch (response) {

            case HttpStatus.ok:
            case HttpStatus.created:
            case HttpStatus.accepted: 

              

        }
  }
}
