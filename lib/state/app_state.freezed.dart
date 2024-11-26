// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  List<Pokemon>? get pokemons => throw _privateConstructorUsedError;
  PokemonDetails? get selectedPokemonDetails =>
      throw _privateConstructorUsedError;
  Wait? get wait => throw _privateConstructorUsedError;
  String? get searchKey => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {List<Pokemon>? pokemons,
      PokemonDetails? selectedPokemonDetails,
      Wait? wait,
      String? searchKey,
      bool isSearching});

  $PokemonDetailsCopyWith<$Res>? get selectedPokemonDetails;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = freezed,
    Object? selectedPokemonDetails = freezed,
    Object? wait = freezed,
    Object? searchKey = freezed,
    Object? isSearching = null,
  }) {
    return _then(_value.copyWith(
      pokemons: freezed == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
      selectedPokemonDetails: freezed == selectedPokemonDetails
          ? _value.selectedPokemonDetails
          : selectedPokemonDetails // ignore: cast_nullable_to_non_nullable
              as PokemonDetails?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokemonDetailsCopyWith<$Res>? get selectedPokemonDetails {
    if (_value.selectedPokemonDetails == null) {
      return null;
    }

    return $PokemonDetailsCopyWith<$Res>(_value.selectedPokemonDetails!,
        (value) {
      return _then(_value.copyWith(selectedPokemonDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Pokemon>? pokemons,
      PokemonDetails? selectedPokemonDetails,
      Wait? wait,
      String? searchKey,
      bool isSearching});

  @override
  $PokemonDetailsCopyWith<$Res>? get selectedPokemonDetails;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemons = freezed,
    Object? selectedPokemonDetails = freezed,
    Object? wait = freezed,
    Object? searchKey = freezed,
    Object? isSearching = null,
  }) {
    return _then(_$AppStateImpl(
      pokemons: freezed == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>?,
      selectedPokemonDetails: freezed == selectedPokemonDetails
          ? _value.selectedPokemonDetails
          : selectedPokemonDetails // ignore: cast_nullable_to_non_nullable
              as PokemonDetails?,
      wait: freezed == wait
          ? _value.wait
          : wait // ignore: cast_nullable_to_non_nullable
              as Wait?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  _$AppStateImpl(
      {final List<Pokemon>? pokemons,
      this.selectedPokemonDetails,
      this.wait,
      this.searchKey,
      this.isSearching = false})
      : _pokemons = pokemons;

  final List<Pokemon>? _pokemons;
  @override
  List<Pokemon>? get pokemons {
    final value = _pokemons;
    if (value == null) return null;
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PokemonDetails? selectedPokemonDetails;
  @override
  final Wait? wait;
  @override
  final String? searchKey;
  @override
  @JsonKey()
  final bool isSearching;

  @override
  String toString() {
    return 'AppState(pokemons: $pokemons, selectedPokemonDetails: $selectedPokemonDetails, wait: $wait, searchKey: $searchKey, isSearching: $isSearching)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            (identical(other.selectedPokemonDetails, selectedPokemonDetails) ||
                other.selectedPokemonDetails == selectedPokemonDetails) &&
            (identical(other.wait, wait) || other.wait == wait) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_pokemons),
      selectedPokemonDetails,
      wait,
      searchKey,
      isSearching);

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState(
      {final List<Pokemon>? pokemons,
      final PokemonDetails? selectedPokemonDetails,
      final Wait? wait,
      final String? searchKey,
      final bool isSearching}) = _$AppStateImpl;

  @override
  List<Pokemon>? get pokemons;
  @override
  PokemonDetails? get selectedPokemonDetails;
  @override
  Wait? get wait;
  @override
  String? get searchKey;
  @override
  bool get isSearching;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
