import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  //header text
  static TextStyle headline =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle subTitle1 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold);
  static TextStyle subTitle2 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.bold);
  static TextStyle subTitle3 =
      GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.bold);

  //body text
  static TextStyle caption =
      GoogleFonts.poppins(fontSize: 8, fontWeight: FontWeight.normal);
  static TextStyle body1 =
      GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.normal);
  static TextStyle body2 =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.normal);
  static TextStyle body3 =
      GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.normal);

  static TextTheme textTheme = GoogleFonts.poppinsTextTheme().copyWith(
      headline1: headline,
      subtitle1: subTitle1,
      subtitle2: subTitle2,
      bodyText1: body1,
      bodyText2: body2,
      caption: caption);
}
