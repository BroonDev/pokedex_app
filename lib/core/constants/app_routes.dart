import 'package:flutter/material.dart';
import '../../features/home/home_page.dart';

import '../../features/pokemon_detail/pokemon_detail_page.dart';
import '../core.dart';
import 'app_routes_name.dart';

class AppRoutes {
  static const initialRoute = homePageRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: homePageRoute),
            builder: (context) => const HomePage());
      case pokemonDetailPageRoute:
        return MaterialPageRoute(
            settings: const RouteSettings(name: pokemonDetailPageRoute),
            builder: (context) => PokemonDetailPage(
                  idPokemon: settings.arguments as int,
                ));

      default:
        return MaterialPageRoute(
            settings: const RouteSettings(name: errorPageRoute),
            builder: (context) {
              return Scaffold(
                  appBar: AppBar(
                      title: const Center(
                          child: Text(AppConsts.invalidRouteErrorTitle))),
                  body: const Center(
                      child: Text(AppConsts.invalidRouteErrorMessage)));
            });
    }
  }
}
