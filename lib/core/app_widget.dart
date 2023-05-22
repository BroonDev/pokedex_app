import 'package:flutter/material.dart';
import 'core.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: AppColors.getMaterialColor(AppColors.primaryColor),
          scaffoldBackgroundColor: AppColors.primaryColor,
          backgroundColor: AppColors.backgroundColor,
          textTheme: AppTextStyles.textTheme),
      title: "Pokedex APP",
      initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
