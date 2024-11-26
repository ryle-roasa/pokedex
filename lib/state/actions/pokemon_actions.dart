import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex/apis/api_service.dart';
import 'package:pokedex/state/actions/loading_action.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/app_starter.dart';

class GetPokemonsAction extends LoadingAction {
  GetPokemonsAction() : super(key: waitKey);

  static const waitKey = 'get-pokemons';

  @override
  Future<AppState> reduce() async {
    final pokemons = await getIt<ApiService>().pokemonApi.getPokemons();

    return state.copyWith(pokemons: pokemons);
  }
}

class GetPokemonDetailsAction extends LoadingAction {
  GetPokemonDetailsAction(this.pokemonId) : super(key: waitKey);

  static const waitKey = 'get-pokemon-details';

  final int pokemonId;

  @override
  Future<AppState> reduce() async {
    await Future.delayed(1.seconds);

    final pokemonDetails = await getIt<ApiService>().pokemonApi.getPokemonDetails(pokemonId);

    return state.copyWith(selectedPokemonDetails: pokemonDetails);
  }

  @override
  Future<void> after() async {
    await dispatchAndWait(GetPokemonEvolutionsAction(pokemonId));
    super.after();
  }
}

class GetPokemonEvolutionsAction extends LoadingAction {
  GetPokemonEvolutionsAction(this.pokemonId) : super(key: waitKey);

  static const waitKey = 'get-pokemon-evolutions';

  final int pokemonId;

  @override
  Future<AppState?> reduce() async {
    final evolutionChainId = await getIt<ApiService>().pokemonApi.getEvolutionId(pokemonId);

    if (evolutionChainId == 0) return null;

    final evolutions = await getIt<ApiService>().pokemonApi.getEvolutions(evolutionChainId);

    final updatedPokemonDetails = state.selectedPokemonDetails?.copyWith(evolutions: evolutions);

    return state.copyWith(selectedPokemonDetails: updatedPokemonDetails);
  }
}

class SetSearchKeyAction extends ReduxAction<AppState> {
  SetSearchKeyAction(this.searchKey);

  final String searchKey;

  @override
  AppState reduce() => state.copyWith(searchKey: searchKey);
}

class SetIsSearchingAction extends ReduxAction<AppState> {
  SetIsSearchingAction(this.isSearching);

  final bool isSearching;

  @override
  AppState reduce() => state.copyWith(isSearching: isSearching);
}
