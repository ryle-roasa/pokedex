import 'package:dartx/dartx.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/constants/constants.dart';

extension PokemonExt on Pokemon {
  int get id => int.parse(Uri.parse(url ?? emptyString).pathSegments.fourth);
}
