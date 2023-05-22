import 'package:pokedex_app/core/models/pokemon_model.dart';
import 'package:pokedex_app/core/services/dio_service/dio_response.dart';
import 'package:pokedex_app/core/services/dio_service/dio_service.dart';

import '../core.dart';

abstract class PokemonRepository {
  Future<DioResponse> getPokemons({String? nextUrl});
  Future<DioResponse> getPokemonByUrl(String url);
}

class PokemonRepositoryImp implements PokemonRepository {
  final DioService dioClient;
  PokemonRepositoryImp(this.dioClient);

  @override
  Future<DioResponse> getPokemons({String? nextUrl}) async {
    try {
      final response = await dioClient.get(nextUrl ?? 'pokemon');
      final listIdAndUrl = (response.data['results'] as List<dynamic>);
      List<PokemonModel> listPokemon = [];
      for (var element in listIdAndUrl) {
        final resposeByUrl = await getPokemonByUrl(element['url']);
        if (resposeByUrl.status == StatusReponse.success) {
          listPokemon.add(resposeByUrl.result);
        }
      }

      //Extra used for next pagination
      return DioResponse(
        StatusReponse.success,
        listPokemon,
        extra: response.data["next"],
      );
    } catch (e) {
      return DioResponse(
          StatusReponse.error, AppConsts.invalidDataFetchMessage);
    }
  }

  @override
  Future<DioResponse> getPokemonByUrl(String url) async {
    try {
      final response = await dioClient.get(url);

      return DioResponse(
          StatusReponse.success, PokemonModel.fromMap(response.data));
    } catch (e) {
      return DioResponse(
          StatusReponse.error, AppConsts.invalidDataFetchMessage);
    }
  }
}
