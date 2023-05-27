import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../core/models/pokemon_detail_model.dart';
import '../../../core/repositories/pokemon_repository.dart';
import '../../../core/services/dio_service/dio_response.dart';
import '../../../core/utils/functions.dart';

part 'pokemon_detail_store.g.dart';

class PokemonDetailStore = PokemonDetailBase with _$PokemonDetailStore;

enum ChoiceType { next, previous }

abstract class PokemonDetailBase with Store {
  final PokemonRepository repository;
  PokemonDetailBase(this.repository);

  @observable
  bool isLoading = true;

  @action
  setLoading(bool value) {
    isLoading = value;
  }

  @observable
  BuildContext? buildContext;

  @action
  setBuildContext(BuildContext context) {
    buildContext = context;
  }

  @action
  Future initialize(BuildContext context, int id) async {
    setLoading(true);
    await setBuildContext(context);
    await selectPokemon(id);
    await Future.delayed(const Duration(milliseconds: 250));
    setLoading(false);
  }

  @observable
  PokemonDetailModel? pokemonSelected;

  @computed
  Color get pokemonColor => getColorType(pokemonSelected!.type![0]);

  @action
  Future selectPokemon(int id) async {
    DioResponse response = await repository.getPokemonByID(id);

    if (response.status == StatusReponse.success) {
      pokemonSelected = response.result;
    } else {
      ScaffoldMessenger.of(buildContext!).showSnackBar(
          const SnackBar(content: Text('Error accessing pokemon data')));
    }
  }

  @action
  changedPokemon(ChoiceType type) async {
    setLoading(true);
    DioResponse response = await repository.getPokemonByID(
        type == ChoiceType.next
            ? pokemonSelected!.id + 1
            : pokemonSelected!.id - 1);

    if (response.status == StatusReponse.success) {
      pokemonSelected = response.result;
    } else {
      ScaffoldMessenger.of(buildContext!).showSnackBar(
          const SnackBar(content: Text('Error accessing pokemon data')));
    }
    setLoading(false);
  }
}
