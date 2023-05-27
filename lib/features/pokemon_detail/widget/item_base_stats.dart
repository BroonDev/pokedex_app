import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/utils/functions.dart';

class ItemBaseStats extends StatelessWidget {
  final Map<String, dynamic> item;
  final Color color;

  String title() {
    Map<String, String> titles = {
      'hp': 'HP',
      'attack': 'ATK',
      'defense': 'DEF',
      'special-attack': 'SATK',
      'special-defense': 'SDEF',
      'speed': 'SPD'
    };

    return titles.entries.firstWhere(
      (element) {
        return element.key == item.keys.toList().first;
      },
      orElse: () => const MapEntry<String, String>('HP', 'HP'),
    ).value;
  }

  const ItemBaseStats({
    Key? key,
    required this.item,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            SizedBox(
              width: 30,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(title(),
                    style: AppTextStyles.subTitle3.copyWith(color: color)),
              ),
            ),
            const SizedBox(width: 12),
            const VerticalDivider(width: 1, color: AppColors.darkColor),
            const SizedBox(width: 12),
            Text(formatStats(item.values.toList().first as int)),
            const SizedBox(width: 12),
            Expanded(
                child: LinearProgressIndicator(
              backgroundColor: color.withOpacity(0.2),
              value: normalize(
                  double.parse(item.values.toList().first.toString()), 0, 100),
              color: color,
              minHeight: 4,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            )),
          ],
        ),
      ),
    );
  }
}
