import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/apis/models/pokemon_stats.dart';
import 'package:pokedex/enums/pokemon_enum.dart';

part 'pokemon_details.freezed.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  factory PokemonDetails({
    required String name,
    required int id,
    required int height,
    required int weight,
    required int baseExperience,
    required List<String> abilities,
    required List<String> moves,
    required List<PokemonType> types,
    required PokemonStats stats,
    ({Pokemon base, List<Pokemon> firstEvolution, List<Pokemon> secondEvolution})? evolutions,
  }) = _PokemonDetails;
}
