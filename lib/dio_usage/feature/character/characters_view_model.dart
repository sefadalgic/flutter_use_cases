import 'package:advance_flutter/dio_usage/network/service/character_service.dart';
import 'package:advance_flutter/dio_usage/network/service/character_service_impl.dart';
import 'package:mobx/mobx.dart';

part 'characters_view_model.g.dart';

class CharactersViewModel = CharactersViewModelBase with _$CharactersViewModel;

abstract class CharactersViewModelBase with Store {
  late final CharacterService _characterService;

  CharactersViewModelBase() {
    _characterService = CharacterServiceImpl.instance;
  }
}
