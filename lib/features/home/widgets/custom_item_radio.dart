import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/core.dart';
import '../store/home_store.dart';

class CustomItemRadio extends StatelessWidget {
  const CustomItemRadio({
    Key? key,
    required this.homeStore,
    required this.type,
  }) : super(key: key);

  final HomeStore homeStore;
  final FilterType type;

  String get title => type == FilterType.name ? "Name" : "Number";

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 8, right: 20, left: 20, bottom: 8),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          title: Text(
            title,
            style: AppTextStyles.body2.copyWith(color: AppColors.darkColor),
          ),
          contentPadding: EdgeInsets.zero,
          selected: homeStore.filterType == type,
          leading: Radio<FilterType>(
              value: type,
              groupValue: homeStore.filterType,
              onChanged: (FilterType? filter) {
                homeStore.setFilterType(filter!);
              }),
        ),
      );
    });
  }
}
