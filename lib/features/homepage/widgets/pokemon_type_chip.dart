import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon_enum.dart';

class PokemonTypeChip extends StatelessWidget {
  const PokemonTypeChip({
    required this.pokemonType,
    super.key,
  });

  final PokemonType pokemonType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2.0,
        horizontal: 8.0,
      ),
      margin: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 2.0,
      ),
      decoration: BoxDecoration(
        color: pokemonType.color,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        pokemonType.label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
