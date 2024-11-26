import 'package:flutter/material.dart';

const _maxStatValue = 255;

class PokemonBaseStatIndicator extends StatelessWidget {
  const PokemonBaseStatIndicator({
    required this.baseStatLabel,
    required this.baseStat,
    this.indicatorColor,
    super.key,
  });

  final String baseStatLabel;
  final int baseStat;
  final Color? indicatorColor;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(baseStatLabel),
            ),
            Expanded(
              flex: 4,
              child: LinearProgressIndicator(
                value: baseStat / _maxStatValue,
                color: indicatorColor ?? Colors.orange,
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      );
}
