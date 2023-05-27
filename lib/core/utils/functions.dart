import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core.dart';

String formatId(int id) {
  var format = NumberFormat('000');
  return "#${format.format(id)}";
}

String capitalize(String data) {
  return "${data[0].toUpperCase()}${data.substring(1).toLowerCase()}";
}

Color getColorType(String name) {
  return AppColors.colorsType.entries
      .firstWhere((item) => item.key == name.toLowerCase())
      .value;
}

double normalize(double value, double min, double max) {
  return ((value - min) / (max - min)).clamp(0, 1);
}

String formatStats(int id) {
  var format = NumberFormat('000');
  return format.format(id);
}
