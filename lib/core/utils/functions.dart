import 'package:intl/intl.dart';

String formatId(int id) {
  var format = NumberFormat('000');
  return "#${format.format(id)}";
}
