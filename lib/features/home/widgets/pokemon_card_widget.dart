import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/models/pokemon_model.dart';
import '../../../core/utils/functions.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;
  final Function onTap;

  const PokemonCardWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await onTap();
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.only(left: 14, top: 24),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mediumColor.withOpacity(0.20),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(6),
              height: 44,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 12, top: 12),
              child: Text(
                formatId(pokemon.id),
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.mediumColor, fontSize: 12),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: pokemon.image != null
                  ? CachedNetworkImage(
                      imageUrl: pokemon.image!,
                      fit: BoxFit.fill,
                      height: 72,
                      width: 72,
                      placeholder: (context, url) =>
                          Image.asset(AppIcons.pokemonEmpty),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image.asset(AppIcons.pokemonEmpty, height: 72, width: 72),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                capitalize(pokemon.name),
                textAlign: TextAlign.center,
                style: AppTextStyles.body3.copyWith(
                  color: AppColors.darkColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
