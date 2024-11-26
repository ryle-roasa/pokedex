import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/apis/models/pokemon.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/features/homepage/widgets/pokemon_tile.dart';
import 'package:pokedex/models/async_result.dart';
import 'package:pokedex/utils/app_starter.dart';
import 'package:pokedex/utils/debouncer.dart';
import 'package:pokedex/widgets/loading_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    required this.pokemons,
    required this.onSearchPokemons,
    required this.onSetIsSearching,
    required this.isSearching,
    super.key,
  });

  final AsyncResult<List<Pokemon>> pokemons;
  final ValueChanged<String> onSearchPokemons;
  final ValueChanged<bool> onSetIsSearching;
  final bool isSearching;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool showSearchBar;

  @override
  void initState() {
    super.initState();
    showSearchBar = widget.isSearching;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() => showSearchBar = !showSearchBar);
                widget.onSetIsSearching(showSearchBar);
              },
              icon: const Icon(Icons.search),
            ),
            if (showSearchBar)
              Expanded(
                child: TextField(onChanged: (value) {
                  getIt<Debouncer>().run(
                    action: () => widget.onSearchPokemons(value),
                    key: 'search-pokemons',
                    duration: 2.seconds,
                  );
                }),
              ),
          ],
        ),
        body: Container(
          child: widget.pokemons.when(
            success: (pokemons) => GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              scrollDirection: Axis.vertical,
              children: pokemons.map((pokemon) => PokemonTile(pokemon: pokemon)).toList(),
            ),
            loading: () => const LoadingIndicator(),
            error: (_) => const Icon(Icons.error),
          ),
        ),
      );
}
