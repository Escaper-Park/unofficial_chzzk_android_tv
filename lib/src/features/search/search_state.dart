import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/auto_complete_controller.dart';

mixin class SearchState {
  /// Get the auto complete search channel and category results.
  AsyncValue<List<String>> getAsyncAutoCompleteKeywords(WidgetRef ref) =>
      ref.watch(autoCompleteControllerProvider);
}
