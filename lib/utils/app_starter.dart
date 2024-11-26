import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/apis/api_service.dart';
import 'package:pokedex/pokedex_app.dart';
import 'package:pokedex/state/app_state.dart';
import 'package:pokedex/utils/debouncer.dart';

final getIt = GetIt.instance;

Future<void> startApp() async {
  final store = Store<AppState>(initialState: AppState.init());

  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<Debouncer>(() => Debouncer());

  runApp(PokedexApp(store: store));
}
