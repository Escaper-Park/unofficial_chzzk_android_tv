import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controller/search_controller.dart';
import '../search.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKeywordController = useTextEditingController();
    final searchFieldFocusNode = useFocusNode();

    final GlobalKey<FormState> searchFormKey =
        useMemoized(GlobalKey<FormState>.new, const []);

    useListenable(searchKeywordController);

    return DashboardScreen(
      useTextField: true,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchTextField(
                  formKey: searchFormKey,
                  controller: searchKeywordController,
                  searchFieldFocusNode: searchFieldFocusNode,
                  onFieldSubmitted: (_) async {
                    if (context.mounted) {
                      bool? isValid = searchFormKey.currentState?.validate();

                      if (isValid == true) {
                        await ref
                            .read(searchResultsControllerProvider.notifier)
                            .search(searchKeywordController.text);
                      }
                    }
                  },
                ),
                const SizedBox(height: 12.0),
                const MenuHeaderText(text: '검색 결과'),
                const SizedBox(height: 12.0),
                const Expanded(child: SearchResults()),
              ],
            ),
          ),
          const Expanded(
            flex: 3,
            child: SearchChannelInfo(),
          ),
        ],
      ),
    );
  }
}
