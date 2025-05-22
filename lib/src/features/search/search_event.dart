import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../utils/extensions/custom_extensions.dart';
import '../home/controller/home_refresh_controller.dart';
import 'controller/auto_complete_controller.dart';

mixin class SearchEvent {
  void pushSearchResultWithKeyword(BuildContext context, String? keyword) {
    if (keyword != null && keyword.isNotEmpty) {
      context.pushTo(
        context: context,
        currentLocation: AppRoute.search,
        appRoute: AppRoute.searchResult,
        pathParameters: {'keyword': keyword},
      );
    }
  }

  Future<void> updateAutoComplete(
    WidgetRef ref, {
    required String keyword,
  }) async {
    await ref
        .read(autoCompleteControllerProvider.notifier)
        .updateAutoCompleteKeywords(keyword: keyword);
  }

  void refreshHome(WidgetRef ref) =>
      ref.read(homeRefreshControllerProvider.notifier).refresh();
}
