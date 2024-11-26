import 'dart:ui';

import 'package:dartx/dartx.dart';

enum PokemonType {
  normal('normal'),
  fire('fire'),
  water('water'),
  electric('electric'),
  grass('grass'),
  ice('ice'),
  fighting('fighting'),
  poison('poison'),
  ground('ground'),
  flying('flying'),
  psychic('psychic'),
  bug('bug'),
  rock('rock'),
  ghost('ghost'),
  dragon('dragon'),
  dark('dark'),
  steel('steel'),
  fairy('fairy');

  final String value;
  const PokemonType(this.value);

  static PokemonType fromString(String value) => PokemonType.values.firstWhere((type) => type.value == value);

  String get label => name.capitalize();

  Color get color => switch (this) {
        PokemonType.normal => const Color(0xFFA8A77A),
        PokemonType.fire => const Color(0xFFEE8130),
        PokemonType.water => const Color(0xFF6390F0),
        PokemonType.electric => const Color(0xFFF7D02C),
        PokemonType.grass => const Color(0xFF7AC74C),
        PokemonType.ice => const Color(0xFF96D9D6),
        PokemonType.fighting => const Color(0xFFC22E28),
        PokemonType.poison => const Color(0xFFA33EA1),
        PokemonType.ground => const Color(0xFFE2BF65),
        PokemonType.flying => const Color(0xFFA98FF3),
        PokemonType.psychic => const Color(0xFFF95587),
        PokemonType.bug => const Color(0xFFA6B91A),
        PokemonType.rock => const Color(0xFFB6A136),
        PokemonType.ghost => const Color(0xFF735797),
        PokemonType.dragon => const Color(0xFF6F35FC),
        PokemonType.dark => const Color(0xFF705746),
        PokemonType.steel => const Color(0xFFB7B7CE),
        PokemonType.fairy => const Color(0xFFD685AD),
      };

  Color get lightColor => switch (this) {
        PokemonType.normal => const Color(0xFFc2c1a2),
        PokemonType.fire => const Color(0xFFf3a76e),
        PokemonType.water => const Color(0xFF92b1f4),
        PokemonType.electric => const Color(0xFFf9de6b),
        PokemonType.grass => const Color(0xFFa2d882),
        PokemonType.ice => const Color(0xFFb5e4e2),
        PokemonType.fighting => const Color(0xFFde645f),
        PokemonType.poison => const Color(0xFFc86ec6),
        PokemonType.ground => const Color(0xFFebd293),
        PokemonType.flying => const Color(0xFFc3b1f7),
        PokemonType.psychic => const Color(0xFFfb88ab),
        PokemonType.bug => const Color(0xFFd2e547),
        PokemonType.rock => const Color(0xFFd3c26b),
        PokemonType.ghost => const Color(0xFF9d86b9),
        PokemonType.dragon => const Color(0xFF9a72fd),
        PokemonType.dark => const Color(0xFFa78772),
        PokemonType.steel => const Color(0xFFcdcddd),
        PokemonType.fairy => const Color(0xFFe2aac6),
      };
}
