import 'package:async_redux/async_redux.dart';
import 'package:pokedex/state/app_state.dart';

abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({
    required this.key,
    this.otherKeys = const <String>[],
  });

  final String key;
  final List<String> otherKeys;

  @override
  void before() {
    dispatch(WaitAction.add(key));
    for (var key in otherKeys) {
      dispatch(WaitAction.add(key));
    }
  }

  @override
  void after() {
    dispatch(WaitAction.remove(key));
    for (var key in otherKeys) {
      dispatch(WaitAction.remove(key));
    }
  }
}
