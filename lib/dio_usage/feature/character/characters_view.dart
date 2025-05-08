import 'package:advance_flutter/dio_usage/base/base_state.dart';
import 'package:advance_flutter/dio_usage/feature/character/character_model.dart';
import 'package:advance_flutter/dio_usage/feature/character/widget/character_card_widget.dart';
import 'package:advance_flutter/dio_usage/network/service/character_service_impl.dart';
import 'package:flutter/material.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});
  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends BaseState<CharactersView> {
  late final Future<List<CharacterModel?>> characters;
  final String title = 'Game Of Thrones Characters';

  @override
  void initState() {
    super.initState();
    characters = CharacterServiceImpl.instance.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: characters,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 270),
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  final character = snapshot.data?[index];
                  return CharacterCardWidget(character: character!);
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
