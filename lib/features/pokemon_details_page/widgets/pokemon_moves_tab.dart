import 'package:flutter/material.dart';

class PokemonMovesTab extends StatelessWidget {
  const PokemonMovesTab({
    required this.pokemonMoves,
    this.chipColor,
    super.key,
  });

  final List<String> pokemonMoves;
  final Color? chipColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 2,
        direction: Axis.horizontal,
        children: pokemonMoves
            .map(
              (move) => Chip(
                label: Text(move),
                labelPadding: EdgeInsets.zero,
                backgroundColor: chipColor,
              ),
            )
            .toList(),
      ),
    );
  }
}
