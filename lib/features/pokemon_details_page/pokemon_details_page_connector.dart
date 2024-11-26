import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/enums/pokemon_enum.dart';
import 'package:pokedex/extensions/pokemon_ext.dart';
import 'package:pokedex/features/pokemon_details_page/pokemon_details_page.dart';
import 'package:pokedex/features/pokemon_details_page/pokemon_details_page_vm.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonDetailsPageConnector extends StatelessWidget {
  const PokemonDetailsPageConnector({
    required this.pokemon,
    required this.types,
    super.key,
  });

  final Pokemon pokemon;
  final List<PokemonType> types;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PokemonDetailsPageVm>(
      vm: () => PokemonDetailsPageVmFactory(pokemon.id),
      onInit: (store) async => store.dispatchAndWait(GetPokemonDetailsAction(pokemon.id)),
      builder: (context, vm) => PokemonDetailsPage(
        pokemon: pokemon,
        pokemonDetails: vm.selectedPokemonDetails,
        types: types,
      ),
    );
  }
}
