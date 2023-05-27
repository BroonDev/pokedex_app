import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/core.dart';
import '../store/home_store.dart';
import 'custom_item_radio.dart';

class FilterButtonWidget extends StatefulWidget {
  const FilterButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  HomeStore homeStore = GetIt.instance<HomeStore>();

  showAlertDialog() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 110),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, bottom: 16, left: 24, right: 42),
                    child: Text(
                      AppConsts.titleLabelFilterWidget,
                      style: AppTextStyles.subTitle1.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomItemRadio(
                                type: FilterType.number, homeStore: homeStore),
                            CustomItemRadio(
                                type: FilterType.name, homeStore: homeStore),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: AppColors.whiteColor,
      child: IconButton(
        onPressed: () {
          showAlertDialog();
        },
        icon: Observer(builder: (context) {
          return Image.asset(
            homeStore.filterType == FilterType.number
                ? AppIcons.filterNumber
                : homeStore.filterType == FilterType.name
                    ? AppIcons.filterName
                    : AppIcons.filterStandard,
            color: AppColors.primaryColor,
            cacheHeight: 10,
            cacheWidth: 10,
          );
        }),
        splashRadius: 25,
        padding: const EdgeInsets.all(12),
      ),
    );
  }
}
