import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/core/services/dio_service/dio_response.dart';

import '../../../core/models/pokemon_model.dart';
import '../../../core/repositories/pokemon_repository.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

enum FilterType { standard, name, number }

abstract class HomeStoreBase with Store {
  final PokemonRepository repository;
  HomeStoreBase(this.repository);

  @observable
  BuildContext? buildContext;

  @action
  setBuildContext(BuildContext context) {
    buildContext = context;
  }

  @observable
  bool? isLoading;

  @action
  setIsLoading(bool loading) {
    isLoading = loading;
  }

  @action
  void initialize(BuildContext context) {
    setBuildContext(context);
    getPokemons();
    setNextUrl('');
    setTextFilter('');
    setFilterType(FilterType.standard);
  }

  @observable
  String nextUrl = '';

  @action
  setNextUrl(String url) {
    nextUrl = url;
  }

  @observable
  List<PokemonModel> listPokemon = [];

  @action
  Future getPokemons({bool next = false}) async {
    setIsLoading(true);
    DioResponse response =
        await repository.getPokemons(nextUrl: next == true ? nextUrl : null);

    if (response.status == StatusReponse.success) {
      listPokemon.addAll(response.result);
      setNextUrl(response.extra);
    } else {
      listPokemon = [];
    }
    setIsLoading(false);
  }

  @observable
  List<PokemonModel> listPokemonFilter = [];

  @observable
  String textFilter = '';

  @action
  setTextFilter(String filter) {
    if (textFilter != '') {
      listPokemonFilter == listPokemon;
    } else {
      listPokemon = listPokemonFilter;
    }

    textFilter = filter;
  }

  @observable
  FilterType filterType = FilterType.name;

  @action
  setFilterType(FilterType type) {
    filterType = type;
  }

  @action
  filterList(String filter) {
    setTextFilter(filter);
    if (filter != '') {
      listPokemon = listPokemonFilter.where((element) {
        if (filterType == FilterType.number) {
          return element.id.toString().toLowerCase().contains(filter);
        } else {
          return element.name.toString().toLowerCase().contains(filter);
        }
      }).toList();
    } else {
      listPokemon = listPokemonFilter;
    }
  }
}
