import 'package:advance_flutter/dio_usage/feature/character/character_model.dart';
import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: Image.network(
                character.imageUrl ?? '',
                fit: BoxFit.fill,
              )),
          Expanded(
              child: Center(
                  child: Text(
            character.fullName ?? '',
            style: Theme.of(context).textTheme.titleMedium,
          ))),
        ],
      ),
    );
  }
}
