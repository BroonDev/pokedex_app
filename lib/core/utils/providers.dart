import 'package:get_it/get_it.dart';
import 'package:pokedex_app/core/repositories/pokemon_repository.dart';
import 'package:pokedex_app/core/services/dio_service/dio_service.dart';
import 'package:pokedex_app/features/pokemon_detail/store/pokemon_detail_store.dart';

import '../../features/home/store/home_store.dart';

final GetIt getIt = GetIt.instance;

setupProviders() {
  final DioService dio = DioService();

  getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImp(dio));
  getIt.registerLazySingleton<HomeStore>(
      () => HomeStore(getIt<PokemonRepository>()));
  getIt.registerLazySingleton<PokemonDetailStore>(
      () => PokemonDetailStore(getIt<PokemonRepository>()));
}
