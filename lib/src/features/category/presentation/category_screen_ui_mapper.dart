import 'category_screen_string.dart';

String formatCategoryMetricCount(int value) {
  final absoluteValue = value.abs();

  if (absoluteValue >= 10000) {
    return '${(value / 10000).toStringAsFixed(1)}'
        '${CategoryScreenString.tenThousandUnit}';
  }

  if (absoluteValue >= 1000) {
    return '${(value / 1000).toStringAsFixed(1)}'
        '${CategoryScreenString.thousandUnit}';
  }

  return '$value';
}
