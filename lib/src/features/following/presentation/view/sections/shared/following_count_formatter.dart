import 'package:intl/intl.dart';

String formatFollowingCount(int value) {
  return _decimalFormat.format(value);
}

final _decimalFormat = NumberFormat.decimalPattern();
