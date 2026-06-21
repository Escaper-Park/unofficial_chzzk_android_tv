import '../../../../../../core/utils/utils.dart';
import '../../../search_results_screen_string.dart';

String formatSearchResultFollowerCount(int value) {
  final safeValue = value < 0 ? 0 : value;
  final count = formatKoDecimal(safeValue);

  return '$count ${SearchResultsScreenString.followerUnit}';
}
