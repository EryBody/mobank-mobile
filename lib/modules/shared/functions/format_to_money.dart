
import 'package:intl/intl.dart';

String formatToMoney(num value) {
  final formatter = NumberFormat("#,##0.00", "en_US");
  return formatter.format(value);
}


String formatCurrency(String value) {
  // Remove the dollar sign, commas, and periods
  String formattedValue = value.replaceAll(RegExp(r'[^\d]'), '');
  return formattedValue;
}