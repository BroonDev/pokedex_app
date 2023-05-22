import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/models/pokemon_model.dart';
import '../../../core/utils/functions.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemonModel;

  const PokemonCardWidget(
    this.pokemonModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
                formatId(pokemonModel.id),
                style: AppTextStyles.caption
                    .copyWith(color: AppColors.mediumColor, fontSize: 12),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: pokemonModel.image != null
                  ? Image.network(
                      pokemonModel.image!,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                      height: 72,
                      width: 72,
                      cacheHeight: 72,
                      cacheWidth: 72,
                    )
                  : const Icon(
                      AppIcons.pokeball,
                      size: 72,
                      color: AppColors.iceTypeColor,
                    ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                "${pokemonModel.name[0].toUpperCase()}${pokemonModel.name.substring(1).toLowerCase()}",
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
