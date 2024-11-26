import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon_stats.dart';
import 'package:pokedex/features/pokemon_details_page/widgets/pokemon_base_stat_indicator.dart';

class PokemonBaseStatsTab extends StatelessWidget {
  const PokemonBaseStatsTab({
    required this.pokemonStats,
    super.key,
  });

  final PokemonStats pokemonStats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokemonBaseStatIndicator(
          baseStatLabel: 'HP',
          baseStat: pokemonStats.hp,
        ),
        PokemonBaseStatIndicator(
          baseStatLabel: 'Attack',
          baseStat: pokemonStats.attack,
        ),
        PokemonBaseStatIndicator(
          baseStatLabel: 'Defense',
          baseStat: pokemonStats.defense,
        ),
        PokemonBaseStatIndicator(
          baseStatLabel: 'Sp-Attack',
          baseStat: pokemonStats.specialAttack,
        ),
        PokemonBaseStatIndicator(
          baseStatLabel: 'Sp-Def',
          baseStat: pokemonStats.specialDefense,
        ),
        PokemonBaseStatIndicator(
          baseStatLabel: 'Speed',
          baseStat: pokemonStats.speed,
        ),
      ],
    );
  }
}
