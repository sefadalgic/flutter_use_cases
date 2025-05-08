import 'package:advance_flutter/dio_usage/feature/character/character_model.dart';
import 'package:advance_flutter/dio_usage/network/network_manager.dart';
import 'package:advance_flutter/dio_usage/network/service/character_service.dart';
import 'package:dio/dio.dart';

class CharacterServiceImpl extends CharacterService {
  static CharacterServiceImpl? _instance;
  static CharacterServiceImpl get instance {
    _instance ??= CharacterServiceImpl._init();
    return _instance!;
  }

  CharacterServiceImpl._init() {
    _networkManager = NetworkManager.instance;
  }

  late final NetworkManager _networkManager;

  @override
  Future<List<CharacterModel?>> getCharacters() async {
    try {
      final response = await _networkManager.dio.get('Characters');
      final List data = response.data;
      return data.map((e) => CharacterModel.fromJson(e)).toList();
    } on DioException catch (e) {
      throw Exception(_handleDioError(e));
    }
  }

  String _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return "Sunucuya bağlanılamadı.";
      case DioExceptionType.receiveTimeout:
        return "Sunucudan yanıt alınamadı.";
      case DioExceptionType.badResponse:
        return "Hatalı yanıt alındı: ${error.response?.statusCode}";
      case DioExceptionType.unknown:
        return "İnternet bağlantınızı kontrol edin.";
      default:
        return "Bir hata oluştu.";
    }
  }
}
