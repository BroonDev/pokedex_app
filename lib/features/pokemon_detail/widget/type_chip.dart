import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../../../core/utils/functions.dart';

class TypeChip extends StatelessWidget {
  final String type;

  const TypeChip(
    this.type, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        capitalize(type),
        style: AppTextStyles.subTitle3.copyWith(color: AppColors.whiteColor),
      ),
      backgroundColor: getColorType(type),
    );
  }
}
