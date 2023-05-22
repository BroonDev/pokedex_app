import 'package:flutter/material.dart';

class AppColors {
  //Primary
  static const Color primaryColor = Color(0xFFDC0A2D);
  //Types
  static const Color bugTypeColor = Color(0xFFA7B723);
  static const Color darkTypeColor = Color(0xFF75574C);
  static const Color dragonTypeColor = Color(0xFF7037FF);
  static const Color electricTypeColor = Color(0xFFF9CF30);
  static const Color fairyTypeColor = Color(0xFFE69EAC);
  static const Color fightingTypeColor = Color(0x0fc12239);
  static const Color fireTypeColor = Color(0xFFF57D31);
  static const Color flyingTypeColor = Color(0xFFA891EC);
  static const Color ghostTypeColor = Color(0xFF70559B);
  static const Color normalTypeColor = Color(0xFFAAA67F);
  static const Color grassTypeColor = Color(0xFF74CB48);
  static const Color groundTypeColor = Color(0xFFDEC168);
  static const Color iceTypeColor = Color(0xFF9AD6DF);
  static const Color poisonTypeColor = Color(0xFFA43E9E);
  static const Color psychicTypeColor = Color(0xFFFB5584);
  static const Color rockTypeColor = Color(0xFFB69E31);
  static const Color steelTypeColor = Color(0xFFB7B9D0);
  static const Color waterTypeColor = Color(0xFF6493EB);

  //Grayscale
  static const Color darkColor = Color(0xFF212121);
  static const Color mediumColor = Color(0xFF666666);
  static const Color lightColor = Color(0xFFE0E0E0);
  static const Color backgroundColor = Color(0xFFEFEFEF);
  static const Color whiteColor = Color(0xFFFFFFFF);

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }
}
