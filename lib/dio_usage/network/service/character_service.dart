import 'package:advance_flutter/dio_usage/feature/character/character_model.dart';

abstract class CharacterService {
  Future<List<CharacterModel?>> getCharacters();
}
