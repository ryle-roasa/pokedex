import 'package:flutter/material.dart';
import 'package:pokedex/enums/pokemon_enum.dart';

class BaseTile extends StatelessWidget {
  const BaseTile({
    required this.child,
    this.tileColor,
    super.key,
  });

  final Widget child;
  final Color? tileColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: tileColor ?? PokemonType.normal.color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );
}
