import 'package:pokedex/apis/handlers/pokemon_handler.dart';

class ApiService {
  factory ApiService() => _apiService;

  ApiService._internal();

  static final ApiService _apiService = ApiService._internal();

  late final PokemonApi pokemonApi = PokemonApi();
}
