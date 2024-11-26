import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/homepage/homepage_connector.dart';
import 'package:pokedex/state/app_state.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({
    required this.store,
    super.key,
  });

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) => StoreProvider(
        store: store,
        child: const MaterialApp(
          title: 'Pokedex',
          debugShowCheckedModeBanner: false,
          home: HomePageConnector(),
        ),
      );
}
