import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/extensions/pokemon_ext.dart';
import 'package:pokedex/features/homepage/homepage_connector.dart';
import 'package:pokedex/models/async_result.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageVmFactory extends VmFactory<AppState, HomePageConnector, HomePageVm> {
  @override
  HomePageVm fromStore() => HomePageVm(
        pokemons: _pokemonsResult,
        onSearchPokemons: _onSearchPokemons,
        onSetIsSearching: _onSetIsSearching,
        isSearching: state.isSearching,
      );

  List<Pokemon> get _pokemons => state.pokemons ?? List.empty();

  AsyncResult<List<Pokemon>> get _pokemonsResult {
    if (state.wait?.isWaiting(GetPokemonsAction.waitKey) == true) {
      return const AsyncResult.loading();
    } else if (_pokemons.isNotEmpty == true) {
      if (!state.isSearching) return AsyncResult.success(_pokemons);

      final searchKey = state.searchKey;

      final filteredPokemons = _pokemons
          .filter((pokemon) =>
              pokemon.name?.toLowerCase().contains(searchKey?.toLowerCase() ?? emptyString) == true ||
              pokemon.id.toString() == searchKey)
          .toList();

      return AsyncResult.success(filteredPokemons);
    } else {
      return const AsyncResult.error();
    }
  }

  void _onSearchPokemons(String searchKey) => dispatchAndWait(SetSearchKeyAction(searchKey));

  void _onSetIsSearching(bool isSearching) {
    dispatchAndWait(SetSearchKeyAction(emptyString));
    dispatchAndWait(SetIsSearchingAction(isSearching));
  }
}

class HomePageVm extends Vm {
  HomePageVm({
    required this.pokemons,
    required this.onSearchPokemons,
    required this.onSetIsSearching,
    required this.isSearching,
  }) : super(equals: [
          pokemons,
          isSearching,
        ]);

  final AsyncResult<List<Pokemon>> pokemons;
  final ValueChanged<String> onSearchPokemons;
  final ValueChanged<bool> onSetIsSearching;
  final bool isSearching;
}
