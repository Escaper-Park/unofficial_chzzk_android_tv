import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'controller/auto_complete_tag_controller.dart';

mixin class SearchTagState {
  AsyncValue<List<String>> getAsyncAutoCompleteTag(WidgetRef ref) =>
      ref.watch(autoCompleteTagControllerProvider);
}
