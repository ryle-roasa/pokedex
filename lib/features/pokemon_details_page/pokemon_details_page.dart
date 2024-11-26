import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/apis/models/pokemon_details.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/enums/pokemon_enum.dart';
import 'package:pokedex/extensions/pokemon_ext.dart';
import 'package:pokedex/extensions/string_ext.dart';
import 'package:pokedex/features/homepage/widgets/pokemon_type_chip.dart';
import 'package:pokedex/features/pokemon_details_page/widgets/pokemon_about_tab.dart';
import 'package:pokedex/features/pokemon_details_page/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex/features/pokemon_details_page/widgets/pokemon_evolution_tab.dart';
import 'package:pokedex/features/pokemon_details_page/widgets/pokemon_moves_tab.dart';
import 'package:pokedex/models/async_result.dart';
import 'package:pokedex/widgets/expanded_image.dart';
import 'package:pokedex/widgets/loading_indicator.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    required this.pokemon,
    required this.pokemonDetails,
    required this.types,
    super.key,
  });

  final Pokemon pokemon;
  final AsyncResult<PokemonDetails> pokemonDetails;
  final List<PokemonType> types;

  @override
  Widget build(BuildContext context) {
    final typeColor = types.first.lightColor;
    final pokemonId = pokemon.id;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: typeColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: typeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    pokemon.name?.capitalize() ?? emptyString,
                    // TODO: Add in theme
                    style: const TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '#${pokemonId.toString().padLeft(4, '0')}',
                  // TODO: Add in theme
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: types.map((type) => PokemonTypeChip(pokemonType: type)).toList(),
            ),
          ),
          PokemonImage(
            pokemonId: pokemonId,
            flex: 2,
            tag: pokemon.name,
          ),
          Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        indicatorColor: types.first.color,
                        tabs: pokemonDetailsTabs.map((detailsTab) => Tab(child: Text(detailsTab))).toList(),
                      ),
                      Expanded(
                        child: pokemonDetails.when(
                          success: (pokemonDetails) => Padding(
                            padding: const EdgeInsets.all(16),
                            child: TabBarView(
                              children: [
                                PokemonAboutTab(
                                  height: pokemonDetails.height,
                                  weight: pokemonDetails.weight,
                                  abilities: pokemonDetails.abilities,
                                  baseExperience: pokemonDetails.baseExperience,
                                ),
                                PokemonBaseStatsTab(pokemonStats: pokemonDetails.stats),
                                PokemonEvolutionTab(pokemonDetails: pokemonDetails),
                                PokemonMovesTab(
                                  pokemonMoves: pokemonDetails.moves,
                                  chipColor: types.first.lightColor.withOpacity(0.5),
                                ),
                              ],
                            ),
                          ),
                          loading: () => const LoadingIndicator(),
                          error: (_) => const Icon(Icons.error),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
