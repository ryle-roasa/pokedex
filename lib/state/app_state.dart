import 'package:async_redux/async_redux.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/apis/models/pokemon_details.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    List<Pokemon>? pokemons,
    PokemonDetails? selectedPokemonDetails,
    Wait? wait,
    String? searchKey,
    @Default(false) bool isSearching,
  }) = _AppState;

  factory AppState.init() => AppState(
        pokemons: List.empty(),
        wait: Wait(),
      );
}
