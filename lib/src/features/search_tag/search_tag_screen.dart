import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;
import '../search/widgets/search_widgets.dart' show SearchScreenBase;
import 'search_tag_event.dart';
import 'search_tag_state.dart';

class SearchTagScreen extends HookConsumerWidget
    with SearchTagEvent, SearchTagState {
  const SearchTagScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardFSN = useFocusScopeNode();
    final autoCompleteFSN = useFocusScopeNode();

    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        refreshHome(ref);
        onPopInvokedHandler.pop(context);
      },
      child: SearchScreenBase(
        routeName: AppRoute.searchTag.routeName,
        getAsyncAutoComplete: (ref) => getAsyncAutoCompleteTag(ref),
        headerText: '태그를 검색해주세요',
        keyboardFSN: keyboardFSN,
        autoCompleteFSN: autoCompleteFSN,
        onNormalKeyPressed: (tag) async =>
            await updateAutoComplete(ref, keyword: tag),
        onPressedAutoComplete: (tag) => pushSearchTagResult(context, tag),
        onEnterPressed: (tag) => pushSearchTagResult(context, tag),
      ),
    );
  }
}
