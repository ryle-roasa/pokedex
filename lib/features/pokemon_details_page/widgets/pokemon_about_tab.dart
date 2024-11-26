import 'package:flutter/material.dart';
import 'package:pokedex/extensions/string_ext.dart';

class PokemonAboutTab extends StatelessWidget {
  const PokemonAboutTab({
    required this.height,
    required this.weight,
    required this.abilities,
    required this.baseExperience,
    super.key,
  });

  final int height;
  final int weight;
  final List<String> abilities;
  final int baseExperience;

  @override
  Widget build(BuildContext context) => Table(
        children: [
          TableRow(
            children: [
              const Text('Height'),
              Text('$height m'),
            ],
          ),
          TableRow(
            children: [
              const Text('Weight'),
              Text('$weight kg'),
            ],
          ),
          TableRow(
            children: [
              const Text('Abilities'),
              // Text('${abilities.first}, ${abilities.length > 1 ? abilities.second : emptyString}'),
              Text(abilities.joinWithComma()),
            ],
          ),
          TableRow(
            children: [
              const Text('Base Experience'),
              Text('$baseExperience xp'),
            ],
          ),
        ],
      );
}
