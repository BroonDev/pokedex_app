import 'package:pokedex_app/core/models/pokemon_model.dart';
import 'package:pokedex_app/core/services/dio_service/dio_response.dart';
import 'package:pokedex_app/core/services/dio_service/dio_service.dart';

import '../core.dart';
import '../models/pokemon_detail_model.dart';

abstract class PokemonRepository {
  Future<DioResponse> getPokemons({String? nextUrl});
  Future<DioResponse> getPokemonByUrl(String url);
  Future<DioResponse> getPokemonByID(int id);
}

class PokemonRepositoryImp implements PokemonRepository {
  final DioService dioClient;
  PokemonRepositoryImp(this.dioClient);

  @override
  Future<DioResponse> getPokemons({String? nextUrl}) async {
    try {
      final response = await dioClient.get(nextUrl ?? 'pokemon');

      List<PokemonModel> listPokemon = [];
      for (var element in response.data['results']) {
        final resposeByUrl = await getPokemonByUrl(element['url']);

        if (resposeByUrl.status == StatusReponse.success) {
          listPokemon.add(resposeByUrl.result);
        }
      }

      //field Extra used for next pagination
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
      final responsePokemon = await dioClient.get(url);

      return DioResponse(
          StatusReponse.success, PokemonModel.fromMap(responsePokemon.data));
    } catch (e) {
      return DioResponse(
          StatusReponse.error, AppConsts.invalidDataFetchMessage);
    }
  }

  @override
  Future<DioResponse> getPokemonByID(int id) async {
    try {
      final responsePokemon = await dioClient.get('pokemon/$id');
      final responseSpecie = await dioClient.get('pokemon-species/$id');

      String pokemonDescription = '';
      try {
        final description = (responseSpecie.data["flavor_text_entries"] as List)
            .firstWhere((element) =>
                element["language"]["name"] == 'en' &&
                (element["version"]["name"] == 'shield' ||
                    element["version"]["name"] == 'sword' ||
                    element["version"]["name"] == 'lets-go-eevee'));

        pokemonDescription =
            description["flavor_text"].toString().replaceAll("\n", ' ');
      } catch (_) {
        pokemonDescription = AppConsts.descriptionNotFound;
      }

      final data = responsePokemon.data;

      (data as Map<String, dynamic>)
          .addAll({'description': pokemonDescription});

      return DioResponse(
          StatusReponse.success, PokemonDetailModel.fromMap(data));
    } catch (e) {
      return DioResponse(
          StatusReponse.error, AppConsts.invalidDataFetchMessage);
    }
  }
}
