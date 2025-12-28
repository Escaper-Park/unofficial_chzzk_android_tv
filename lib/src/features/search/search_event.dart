import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/security/input_validator.dart';
import '../home/controller/home_refresh_controller.dart';
import 'controller/auto_complete_controller.dart';

mixin class SearchEvent {
  void pushSearchResultWithKeyword(BuildContext context, String? keyword) {
    if (keyword != null && keyword.isNotEmpty) {
      // Sanitize the search keyword before using it
      final sanitizedKeyword = InputValidator.sanitizeForSearch(keyword);

      if (sanitizedKeyword.isNotEmpty) {
        context.pushTo(
          context: context,
          currentLocation: AppRoute.search,
          appRoute: AppRoute.searchResult,
          pathParameters: {'keyword': sanitizedKeyword},
        );
      }
    }
  }

  Future<void> updateAutoComplete(
    WidgetRef ref, {
    required String keyword,
  }) async {
    // Sanitize input for autocomplete
    final sanitizedKeyword = InputValidator.sanitizeForSearch(keyword);

    await ref
        .read(autoCompleteControllerProvider.notifier)
        .updateAutoCompleteKeywords(keyword: sanitizedKeyword);
  }

  void refreshHome(WidgetRef ref) =>
      ref.read(homeRefreshControllerProvider.notifier).refresh();
}
