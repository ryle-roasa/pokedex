import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/homepage/homepage.dart';
import 'package:pokedex/features/homepage/homepage_vm.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class HomePageConnector extends StatelessWidget {
  const HomePageConnector({super.key});

  @override
  Widget build(BuildContext context) => StoreConnector<AppState, HomePageVm>(
        vm: HomePageVmFactory.new,
        onInit: (store) async => store.dispatchAndWait(GetPokemonsAction()),
        builder: (context, vm) => HomePage(
          pokemons: vm.pokemons,
          onSearchPokemons: vm.onSearchPokemons,
          onSetIsSearching: vm.onSetIsSearching,
          isSearching: vm.isSearching,
        ),
      );
}
