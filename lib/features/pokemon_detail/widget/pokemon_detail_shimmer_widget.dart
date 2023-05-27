import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/widgets/shimmer_widget.dart';
import '../../../core/core.dart';

class PokemonDetailShimmerWidget extends StatelessWidget {
  const PokemonDetailShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.darkColor,
      body: SafeArea(
        child: Stack(
          children: [
            AppBar(
              elevation: 0,
              titleSpacing: 0,
              backgroundColor: AppColors.darkColor,
              title: Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ShimmerWidget.rectangular(height: 30, width: 200),
                    ShimmerWidget.rectangular(height: 30, width: 50),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: Image.asset(
                AppIcons.pokeball,
                color: AppColors.whiteColor.withOpacity(0.2),
                cacheHeight: 300,
                cacheWidth: 300,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.3, left: 4, right: 4, bottom: 4),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 56),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            ShimmerWidget.rectangular(height: 30, width: 120),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'About',
                          style: AppTextStyles.subTitle1
                              .copyWith(color: AppColors.mediumColor),
                        ),
                        const SizedBox(height: 16),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              ShimmerWidget.rectangular(width: 50, height: 40),
                              VerticalDivider(
                                  color: AppColors.lightColor, width: 2),
                              ShimmerWidget.rectangular(width: 50, height: 40),
                              VerticalDivider(
                                  color: AppColors.lightColor, width: 2),
                              ShimmerWidget.rectangular(width: 50, height: 40),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: ShimmerWidget.rectangular(
                                width: double.infinity, height: 30),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text('Base Stats',
                            style: AppTextStyles.subTitle1
                                .copyWith(color: AppColors.mediumColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: const [
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                              SizedBox(height: 4),
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                              SizedBox(height: 4),
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                              SizedBox(height: 4),
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                              SizedBox(height: 4),
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                              SizedBox(height: 4),
                              ShimmerWidget.rectangular(
                                  width: double.infinity, height: 30),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          height: 60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.11,
              left: size.width * 0.250,
              child: Shimmer.fromColors(
                baseColor: AppColors.mediumColor.withOpacity(0.8),
                highlightColor: AppColors.mediumColor,
                child: Image.asset(
                  AppIcons.pokemonEmpty,
                  cacheHeight: 200,
                  cacheWidth: 200,
                  color: AppColors.mediumColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
