import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'package:pokedex_app/features/home/store/home_store.dart';

import '../../core/core.dart';
import 'widgets/custom_search_field.dart';
import 'widgets/filter_button_widget.dart';
import 'widgets/pokemon_card_widget.dart';

class HomePage extends StatefulWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeStore homeStore = GetIt.instance<HomeStore>();

  ScrollController? scrollController;
  TextEditingController? filterController;

  @override
  void initState() {
    super.initState();
    homeStore.initialize(context);
    filterController = TextEditingController();
    scrollController = ScrollController();
    scrollController!.addListener(() {
      extendedListPokemon();
    });
  }

  extendedListPokemon() async {
    final maxScroll = scrollController!.position.maxScrollExtent;
    final currentScroll = scrollController!.offset;

    if (currentScroll >= (maxScroll - 100) && homeStore.isLoading == false) {
      await homeStore.getPokemons(next: true);
      Future.delayed(
        const Duration(milliseconds: 250),
        () async {
          //scrollController!.animateTo(currentScroll,
          //  curve: Curves.easeInOut,
          //  duration: const Duration(microseconds: 250));
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: const Icon(AppIcons.pokeball),
          title: Text(AppConsts.pokedexLabel,
              style: AppTextStyles.headline
                  .copyWith(color: AppColors.whiteColor))),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  CustomSearchField(filterController: filterController),
                  const SizedBox(width: 16),
                  const FilterButtonWidget(),
                ],
              )),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 24, left: 12, right: 12, bottom: 24),
                  child: Observer(
                    builder: (context) {
                      if (homeStore.listPokemon.isEmpty) {
                        return Center(
                          child: homeStore.isLoading == true
                              ? const CircularProgressIndicator()
                              : const Text(AppConsts.invalidSearchErrorMessage),
                        );
                      } else {
                        return Column(
                          children: [
                            Expanded(
                              child: GridView.builder(
                                controller: scrollController,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:
                                            (size.width / 120).round(),
                                        childAspectRatio:
                                            size.width / (size.height * 0.55),
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8),
                                itemCount: homeStore.listPokemon.length,
                                itemBuilder: (context, index) {
                                  return PokemonCardWidget(
                                    homeStore.listPokemon[index],
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            homeStore.isLoading == true
                                ? const CircularProgressIndicator()
                                : Container()
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
