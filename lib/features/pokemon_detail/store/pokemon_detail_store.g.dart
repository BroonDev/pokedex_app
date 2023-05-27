// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonDetailStore on PokemonDetailBase, Store {
  Computed<Color>? _$pokemonColorComputed;

  @override
  Color get pokemonColor =>
      (_$pokemonColorComputed ??= Computed<Color>(() => super.pokemonColor,
              name: 'PokemonDetailBase.pokemonColor'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: 'PokemonDetailBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$buildContextAtom =
      Atom(name: 'PokemonDetailBase.buildContext', context: context);

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

  late final _$pokemonSelectedAtom =
      Atom(name: 'PokemonDetailBase.pokemonSelected', context: context);

  @override
  PokemonDetailModel? get pokemonSelected {
    _$pokemonSelectedAtom.reportRead();
    return super.pokemonSelected;
  }

  @override
  set pokemonSelected(PokemonDetailModel? value) {
    _$pokemonSelectedAtom.reportWrite(value, super.pokemonSelected, () {
      super.pokemonSelected = value;
    });
  }

  late final _$initializeAsyncAction =
      AsyncAction('PokemonDetailBase.initialize', context: context);

  @override
  Future<dynamic> initialize(BuildContext context, int id) {
    return _$initializeAsyncAction.run(() => super.initialize(context, id));
  }

  late final _$selectPokemonAsyncAction =
      AsyncAction('PokemonDetailBase.selectPokemon', context: context);

  @override
  Future<dynamic> selectPokemon(int id) {
    return _$selectPokemonAsyncAction.run(() => super.selectPokemon(id));
  }

  late final _$changedPokemonAsyncAction =
      AsyncAction('PokemonDetailBase.changedPokemon', context: context);

  @override
  Future changedPokemon(ChoiceType type) {
    return _$changedPokemonAsyncAction.run(() => super.changedPokemon(type));
  }

  late final _$PokemonDetailBaseActionController =
      ActionController(name: 'PokemonDetailBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$PokemonDetailBaseActionController.startAction(
        name: 'PokemonDetailBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$PokemonDetailBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBuildContext(BuildContext context) {
    final _$actionInfo = _$PokemonDetailBaseActionController.startAction(
        name: 'PokemonDetailBase.setBuildContext');
    try {
      return super.setBuildContext(context);
    } finally {
      _$PokemonDetailBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
buildContext: ${buildContext},
pokemonSelected: ${pokemonSelected},
pokemonColor: ${pokemonColor}
    ''';
  }
}
