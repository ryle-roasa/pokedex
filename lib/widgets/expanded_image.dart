import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/constants/constants.dart';
import 'package:pokedex/widgets/loading_indicator.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    required this.pokemonId,
    this.flex = 0,
    this.tag,
    super.key,
  });

  final int pokemonId;
  final int flex;
  final String? tag;

  @override
  Widget build(BuildContext context) {
    final image = CachedNetworkImage(
      imageUrl: '$artWorkUrl$pokemonId.png',
      placeholder: (_, __) => const LoadingIndicator(),
      errorWidget: (_, __, ___) => const Icon(Icons.error),
    );

    return Expanded(
      flex: flex,
      child: tag != null ? Hero(tag: tag!, child: image) : image,
    );
  }
}
