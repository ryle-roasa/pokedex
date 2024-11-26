import 'package:flutter/material.dart';
import 'package:pokedex/apis/api_service.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/enums/pokemon_enum.dart';
import 'package:pokedex/extensions/pokemon_ext.dart';
import 'package:pokedex/extensions/string_ext.dart';
import 'package:pokedex/features/homepage/widgets/base_tile.dart';
import 'package:pokedex/features/homepage/widgets/pokemon_type_chip.dart';
import 'package:pokedex/features/pokemon_details_page/pokemon_details_page_connector.dart';
import 'package:pokedex/utils/app_starter.dart';
import 'package:pokedex/widgets/expanded_image.dart';
import 'package:pokedex/widgets/loading_indicator.dart';

class PokemonTile extends StatefulWidget {
  const PokemonTile({
    required this.pokemon,
    super.key,
  });

  final Pokemon pokemon;

  @override
  State<PokemonTile> createState() => _PokemonTileState();
}

class _PokemonTileState extends State<PokemonTile> {
  late List<PokemonType> pokemonTypes;
  late bool isLoading = true;

  Future<List<PokemonType>> _getTypes(int pokemonId) async => getIt<ApiService>()
      .pokemonApi
      .getTypes(pokemonId)
      .then((types) => types.map((type) => PokemonType.fromString(type)).toList());

  @override
  Widget build(BuildContext context) {
    final pokemonId = widget.pokemon.id;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailsPageConnector(
              pokemon: widget.pokemon,
              types: pokemonTypes,
            ),
          ),
        );
      },
      child: FutureBuilder(
        future: _getTypes(pokemonId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const BaseTile(child: LoadingIndicator());
          }

          if (snapshot.hasError) return Container();

          final types = snapshot.data;

          if (types == null) return const SizedBox();

          pokemonTypes = types;
          isLoading = false;

          return BaseTile(
            tileColor: types.first.lightColor,
            child: Column(
              children: [
                PokemonImage(
                  pokemonId: pokemonId,
                  flex: 1,
                  tag: widget.pokemon.name,
                ),
                Text(
                  pokemonId.toString().addLeadingZeros(),
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  widget.pokemon.name?.capitalize() ?? emptyString,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: types.map((type) => PokemonTypeChip(pokemonType: type)).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
