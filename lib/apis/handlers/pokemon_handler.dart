import 'package:dartx/dartx.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/apis/models/pokemon_details.dart';
import 'package:pokedex/apis/models/pokemon_stats.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/enums/pokemon_enum.dart';

final dio = Dio();

class PokemonApi {
  Future<List<Pokemon>>? getPokemons() async {
    return await dio
        .get('https://pokeapi.co/api/v2/pokemon?limit=1302')
        .then((response) => (response.data['results'] as List).map((e) => Pokemon.fromJson(e)).toList());
  }

  Future<List<String>> getTypes(int id) async {
    return await dio
        .get('https://pokeapi.co/api/v2/pokemon/$id')
        .then((response) => (response.data['types'] as List).map((type) => type['type']['name'] as String).toList());
  }

  Future<PokemonDetails> getPokemonDetails(int id) async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon/$id').then((response) => response.data);

    final name = response['name'].toString().capitalize();
    final height = response['height'];
    final weight = response['weight'];
    final pokemonId = response['id'];
    final moves = (response['moves'] as List)
        .map((move) => move['move']['name'].toString().capitalize().replaceAll('-', ' '))
        .toList();
    final baseExperience = response['base_experience'];
    final abilities = (response['abilities'] as List)
        .map((ability) => ability['ability']['name'].toString().capitalize().replaceAll('-', ' '))
        .toList();
    final types =
        (response['types'] as List).map((type) => PokemonType.fromString(type['type']['name'].toString())).toList();
    final stats = response['stats'] as List;

    final pokemonStats = PokemonStats(
      hp: stats[0]['base_stat'],
      attack: stats[1]['base_stat'],
      defense: stats[2]['base_stat'],
      specialAttack: stats[3]['base_stat'],
      specialDefense: stats[4]['base_stat'],
      speed: stats[5]['base_stat'],
    );

    return PokemonDetails(
      name: name,
      height: height,
      weight: weight,
      id: pokemonId,
      moves: moves,
      baseExperience: baseExperience,
      abilities: abilities,
      types: types,
      stats: pokemonStats,
    );
  }

  Future<int> getEvolutionId(int id) async {
    final response = await dio
        .get('https://pokeapi.co/api/v2/pokemon-species/$id')
        .then((response) => response.data)
        .onError((_, __) {
      return null;
    });

    if (response == null) return 0;

    final evolutionChainUrl = response['evolution_chain']['url'];

    final evolutionId = int.parse(Uri.parse(evolutionChainUrl ?? emptyString).pathSegments.fourth);

    return evolutionId;
  }

  Future<({Pokemon base, List<Pokemon> firstEvolution, List<Pokemon> secondEvolution})> getEvolutions(
      int evolutionId) async {
    final response =
        await dio.get('https://pokeapi.co/api/v2/evolution-chain/$evolutionId').then((response) => response.data);

    final chain = response['chain'];

    final basePokemon = Pokemon.fromJson(chain['species']);

    final firstEvolution = chain['evolves_to'] as List;

    if (firstEvolution.isEmpty) {
      return (base: basePokemon, firstEvolution: <Pokemon>[], secondEvolution: <Pokemon>[]);
    }

    final firstEvolutions = firstEvolution.map((evolution) => Pokemon.fromJson(evolution['species'])).toList();

    final secondEvolution = firstEvolution.first['evolves_to'] as List;

    if (secondEvolution.isEmpty) {
      return (base: basePokemon, firstEvolution: firstEvolutions, secondEvolution: <Pokemon>[]);
    }

    final secondEvolutions = secondEvolution.map((evolution) => Pokemon.fromJson(evolution['species'])).toList();

    return (
      base: basePokemon,
      firstEvolution: firstEvolutions,
      secondEvolution: secondEvolutions,
    );
  }
}
