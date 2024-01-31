import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../controller/search/search_controller.dart';

import '../dashboard/dashboard_screen.dart';
import './widgets/search_text_field.dart';
import './widgets/search_results.dart';
import './widgets/search_channel_data.dart';
import 'widgets/search_result_header.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey =
        useMemoized(GlobalKey<FormState>.new, const []);

    final searchController = useTextEditingController();

    final searchFieldFocusNode = useFocusNode();
    final searchButtonFocusNode = useFocusNode();
    final resultsFocusNode = useFocusNode();

    return DashboardScreen(
      currentScreenIndex: 2,
      screen: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchTextField(
                      formKey: formKey,
                      searchController: searchController,
                      textFocusNode: searchFieldFocusNode,
                      buttonFocusNode: searchButtonFocusNode,
                      resultsFocusNode: resultsFocusNode,
                      searchCallback: () async {
                        bool? isValid = formKey.currentState?.validate();

                        if (isValid == true) {
                          ref
                              .read(searchResultsControllerProvider.notifier)
                              .searchChannel(searchController.text);
                        }
                      },
                    ),
                    const SizedBox(height: 10.0),
                    const SearchResultHeader(),
                    Expanded(
                      child: SearchResults(
                        resultsFocusNode: resultsFocusNode,
                        searchFieldFocusNode: searchFieldFocusNode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VerticalDivider(
              thickness: 1.0,
              width: 0.0,
            ),
            const Expanded(
              flex: 5,
              child: SearchChannelData(),
            ),
          ],
        ),
      ),
    );
  }
}
