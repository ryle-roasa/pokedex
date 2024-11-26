import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/extensions/pokemon_ext.dart';
import 'package:pokedex/widgets/expanded_image.dart';

class EvolutionThumbnailList extends StatelessWidget {
  const EvolutionThumbnailList({
    required this.pokemons,
    this.isBasePokemon = false,
    super.key,
  });

  final List<Pokemon> pokemons;
  final bool isBasePokemon;

  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          children: pokemons
              .map((pokemon) => Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.chevron_right_rounded,
                          color: isBasePokemon ? Colors.transparent : Colors.black,
                        ),
                        PokemonImage(
                          pokemonId: pokemon.id,
                          flex: 1,
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      );
}
