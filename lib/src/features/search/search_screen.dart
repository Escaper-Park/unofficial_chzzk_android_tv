import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/screen/screen_widgets.dart' show PopScopeScreen;
import 'widgets/search_widgets.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchScreen extends HookConsumerWidget with SearchEvent, SearchState {
  const SearchScreen({super.key, this.fromHome = false});

  final bool fromHome;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardFSN = useFocusScopeNode();
    final autoCompleteFSN = useFocusScopeNode();

    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        if (fromHome) {
          refreshHome(ref);
        }
        onPopInvokedHandler.pop(context);
      },
      child: SearchScreenBase(
        routeName: AppRoute.search.routeName,
        getAsyncAutoComplete: (ref) => getAsyncAutoCompleteKeywords(ref),
        headerText: '채널, 카테고리를 검색해주세요',
        keyboardFSN: keyboardFSN,
        autoCompleteFSN: autoCompleteFSN,
        onNormalKeyPressed: (keyword) async =>
            await updateAutoComplete(ref, keyword: keyword),
        onPressedAutoComplete: (keyword) =>
            pushSearchResultWithKeyword(context, keyword),
        onEnterPressed: (keyword) =>
            pushSearchResultWithKeyword(context, keyword),
      ),
    );
  }
}
