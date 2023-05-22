// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$buildContextAtom =
      Atom(name: 'HomeStoreBase.buildContext', context: context);

  @override
  BuildContext? get buildContext {
    _$buildContextAtom.reportRead();
    return super.buildContext;
  }

  @override
  set buildContext(BuildContext? value) {
    _$buildContextAtom.reportWrite(value, super.buildContext, () {
      super.buildContext = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeStoreBase.isLoading', context: context);

  @override
  bool? get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool? value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$nextUrlAtom =
      Atom(name: 'HomeStoreBase.nextUrl', context: context);

  @override
  String get nextUrl {
    _$nextUrlAtom.reportRead();
    return super.nextUrl;
  }

  @override
  set nextUrl(String value) {
    _$nextUrlAtom.reportWrite(value, super.nextUrl, () {
      super.nextUrl = value;
    });
  }

  late final _$listPokemonAtom =
      Atom(name: 'HomeStoreBase.listPokemon', context: context);

  @override
  List<PokemonModel> get listPokemon {
    _$listPokemonAtom.reportRead();
    return super.listPokemon;
  }

  @override
  set listPokemon(List<PokemonModel> value) {
    _$listPokemonAtom.reportWrite(value, super.listPokemon, () {
      super.listPokemon = value;
    });
  }

  late final _$listPokemonFilterAtom =
      Atom(name: 'HomeStoreBase.listPokemonFilter', context: context);

  @override
  List<PokemonModel> get listPokemonFilter {
    _$listPokemonFilterAtom.reportRead();
    return super.listPokemonFilter;
  }

  @override
  set listPokemonFilter(List<PokemonModel> value) {
    _$listPokemonFilterAtom.reportWrite(value, super.listPokemonFilter, () {
      super.listPokemonFilter = value;
    });
  }

  late final _$textFilterAtom =
      Atom(name: 'HomeStoreBase.textFilter', context: context);

  @override
  String get textFilter {
    _$textFilterAtom.reportRead();
    return super.textFilter;
  }

  @override
  set textFilter(String value) {
    _$textFilterAtom.reportWrite(value, super.textFilter, () {
      super.textFilter = value;
    });
  }

  late final _$filterTypeAtom =
      Atom(name: 'HomeStoreBase.filterType', context: context);

  @override
  FilterType get filterType {
    _$filterTypeAtom.reportRead();
    return super.filterType;
  }

  @override
  set filterType(FilterType value) {
    _$filterTypeAtom.reportWrite(value, super.filterType, () {
      super.filterType = value;
    });
  }

  late final _$getPokemonsAsyncAction =
      AsyncAction('HomeStoreBase.getPokemons', context: context);

  @override
  Future<dynamic> getPokemons({bool next = false}) {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons(next: next));
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic setBuildContext(BuildContext context) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setBuildContext');
    try {
      return super.setBuildContext(context);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setIsLoading(bool loading) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(loading);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initialize(BuildContext context) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.initialize');
    try {
      return super.initialize(context);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNextUrl(String url) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setNextUrl');
    try {
      return super.setNextUrl(url);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTextFilter(String filter) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setTextFilter');
    try {
      return super.setTextFilter(filter);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFilterType(FilterType type) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFilterType');
    try {
      return super.setFilterType(type);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterList(String filter) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.filterList');
    try {
      return super.filterList(filter);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buildContext: ${buildContext},
isLoading: ${isLoading},
nextUrl: ${nextUrl},
listPokemon: ${listPokemon},
listPokemonFilter: ${listPokemonFilter},
textFilter: ${textFilter},
filterType: ${filterType}
    ''';
  }
}
