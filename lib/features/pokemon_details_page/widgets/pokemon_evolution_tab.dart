import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon_details.dart';
import 'package:pokedex/widgets/evolution_thumbnail_list.dart';

class PokemonEvolutionTab extends StatelessWidget {
  const PokemonEvolutionTab({
    required this.pokemonDetails,
    super.key,
  });

  final PokemonDetails pokemonDetails;

  @override
  Widget build(BuildContext context) {
    final evolutionChain = pokemonDetails.evolutions;
    final basePokemon = evolutionChain?.base;
    final firstEvolutions = evolutionChain?.firstEvolution ?? [];
    final secondEvolutions = evolutionChain?.secondEvolution ?? [];

    if (basePokemon == null) return const Center(child: Icon(Icons.error_outline));

    return Row(
      children: [
        EvolutionThumbnailList(
          pokemons: [basePokemon],
          isBasePokemon: true,
        ),
        if (firstEvolutions.isNotEmpty) EvolutionThumbnailList(pokemons: firstEvolutions),
        if (secondEvolutions.isNotEmpty) EvolutionThumbnailList(pokemons: secondEvolutions),
      ],
    );
  }
}
