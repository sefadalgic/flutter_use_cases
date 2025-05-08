import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkManager {
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;

  // İstek atacağımız url
  final String _baseUrl = 'https://thronesapi.com/api/v2/';

  NetworkManager._init() {
    dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // Istek atılmadan önce çalışan kısım

          debugPrint("İstek gönderiliyor: ${options.uri}");
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          // İsteğin başarılı bir şekilde tamamlandığında çalışan kısım

          debugPrint("İstek tamamlandı: ${response.statusCode}");
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          // Bir hata oluştuğunda çalışan kısım

          debugPrint("Bir hata olustu: ${error.message}");
          return handler.next(error);
        },
      ),
    );
  }
}
