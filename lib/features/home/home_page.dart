import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../../core/services/dio_service/dio_service.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({Key? key}) : super(key: key);

  static DioService dioService = DioService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppConsts.pokedexLabel,
                style: AppTextStyles.headline
                    .copyWith(color: AppColors.whiteColor),
              ),
              InkWell(
                  onTap: () async {
                    Response response = await dioService.get('/pokemon/1');

                    if (response.statusCode == 200) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Test'),
                              content: const Text('dio request OK'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          });
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Test'),
                              content: const Text('dio request error'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    color: AppColors.whiteColor,
                    child: Text(
                      'Dio request',
                      style: AppTextStyles.subTitle2
                          .copyWith(color: AppColors.darkColor),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
