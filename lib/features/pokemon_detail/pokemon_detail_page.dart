import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../core/core.dart';
import '../../core/utils/functions.dart';

import 'store/pokemon_detail_store.dart';
import 'widget/item_base_stats.dart';
import 'widget/pokemon_detail_shimmer_widget.dart';
import 'widget/type_chip.dart';

class PokemonDetailPage extends StatefulWidget {
  static const String route = '/pokemon_detail_page';
  final int idPokemon;
  const PokemonDetailPage({
    Key? key,
    required this.idPokemon,
  }) : super(key: key);

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  PokemonDetailStore store = GetIt.instance<PokemonDetailStore>();

  Color get color => store.pokemonColor;

  @override
  void initState() {
    store.initialize(context, widget.idPokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      if (store.isLoading) {
        return const PokemonDetailShimmerWidget();
      } else {
        return Scaffold(
          backgroundColor: color,
          body: SafeArea(
            child: Stack(
              children: [
                AppBar(
                  elevation: 0,
                  titleSpacing: 0,
                  backgroundColor: color,
                  title: Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            capitalize(store.pokemonSelected!.name),
                            style: AppTextStyles.headline
                                .copyWith(color: AppColors.whiteColor),
                          ),
                        ),
                        Text(
                          formatId(store.pokemonSelected!.id),
                          style: AppTextStyles.subTitle1
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Image.asset(
                    AppIcons.pokeball,
                    color: AppColors.whiteColor.withOpacity(0.2),
                    cacheHeight: 300,
                    cacheWidth: 300,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: size.height * 0.3, left: 4, right: 4, bottom: 4),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            const SizedBox(height: 56),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var item
                                    in store.pokemonSelected!.type!) ...{
                                  TypeChip(item),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 16)),
                                }
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'About',
                              style: AppTextStyles.subTitle1
                                  .copyWith(color: color),
                            ),
                            const SizedBox(height: 16),
                            IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppIcons.weight,
                                            height: 14,
                                            width: 14,
                                          ),
                                          const SizedBox(width: 12),
                                          Text((store.pokemonSelected!.weight *
                                                      0.10)
                                                  .toStringAsPrecision(2) +
                                              ' kg'),
                                        ],
                                      ),
                                      Text(
                                        'Weight',
                                        style: AppTextStyles.caption.copyWith(
                                            color: AppColors.mediumColor),
                                      )
                                    ],
                                  ),
                                  const VerticalDivider(
                                      color: AppColors.lightColor, width: 2),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppIcons.height,
                                            height: 14,
                                            width: 14,
                                          ),
                                          const SizedBox(width: 12),
                                          Text((store.pokemonSelected!.height *
                                                      0.1)
                                                  .toStringAsPrecision(1) +
                                              ' m'),
                                        ],
                                      ),
                                      Text(
                                        'Heigth',
                                        style: AppTextStyles.caption.copyWith(
                                            color: AppColors.mediumColor),
                                      )
                                    ],
                                  ),
                                  const VerticalDivider(
                                      color: AppColors.lightColor, width: 2),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          for (var item in store
                                              .pokemonSelected!.moves!) ...{
                                            Text(
                                              capitalize(item),
                                              style: AppTextStyles.body3
                                                  .copyWith(
                                                      color:
                                                          AppColors.darkColor),
                                            ),
                                          }
                                        ],
                                      ),
                                      Text(
                                        'Moves',
                                        style: AppTextStyles.caption.copyWith(
                                            color: AppColors.mediumColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(store.pokemonSelected!.description!,
                                    style: AppTextStyles.body3
                                        .copyWith(color: AppColors.darkColor)),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text('Base Stats',
                                style: AppTextStyles.subTitle1
                                    .copyWith(color: color)),
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                  children: store.pokemonSelected!.stats!
                                      .map((entry) {
                                return ItemBaseStats(item: entry, color: color);
                              }).toList()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                if (store.pokemonSelected!.id > 1)
                  Positioned(
                    top: size.height * 0.22,
                    left: 0,
                    child: IconButton(
                        onPressed: () async {
                          await store.changedPokemon(ChoiceType.previous);
                        },
                        icon: const Icon(
                          AppIcons.chevronLeft,
                          color: AppColors.whiteColor,
                        )),
                  ),
                if (store.pokemonSelected!.id < 1282)
                  Positioned(
                      top: size.height * 0.22,
                      right: 0,
                      child: IconButton(
                          onPressed: () async {
                            await store.changedPokemon(ChoiceType.next);
                          },
                          icon: const Icon(
                            AppIcons.chevronRight,
                            color: AppColors.whiteColor,
                          ))),
                Positioned(
                  top: size.height * 0.11,
                  left: size.width * 0.250,
                  child: CachedNetworkImage(
                    imageUrl: store.pokemonSelected!.image!,
                    placeholder: (context, url) =>
                        Image.asset(AppIcons.pokemonEmpty),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    height: 200,
                    width: 200,
                  ),
                )
              ],
            ),
          ),
        );
      }
    });
  }
}
