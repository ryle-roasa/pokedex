import 'package:async_redux/async_redux.dart';
import 'package:pokedex/apis/models/pokemon_details.dart';
import 'package:pokedex/features/pokemon_details_page/pokemon_details_page_connector.dart';
import 'package:pokedex/models/async_result.dart';
import 'package:pokedex/state/actions/pokemon_actions.dart';
import 'package:pokedex/state/app_state.dart';

class PokemonDetailsPageVmFactory extends VmFactory<AppState, PokemonDetailsPageConnector, PokemonDetailsPageVm> {
  PokemonDetailsPageVmFactory(this.pokemonId);

  final int pokemonId;

  @override
  PokemonDetailsPageVm fromStore() => PokemonDetailsPageVm(selectedPokemonDetails: _pokemonDetailsResult);

  AsyncResult<PokemonDetails> get _pokemonDetailsResult {
    if (state.wait?.isWaiting(GetPokemonDetailsAction.waitKey) == true) {
      return const AsyncResult.loading();
    } else if (state.selectedPokemonDetails != null) {
      return AsyncResult.success(state.selectedPokemonDetails!);
    } else {
      return const AsyncResult.error();
    }
  }
}

class PokemonDetailsPageVm extends Vm {
  PokemonDetailsPageVm({required this.selectedPokemonDetails}) : super(equals: [selectedPokemonDetails]);

  final AsyncResult<PokemonDetails> selectedPokemonDetails;
}
