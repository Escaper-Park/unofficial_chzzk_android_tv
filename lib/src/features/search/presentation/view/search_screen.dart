import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/shell/shell.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/keyboard/keyboard.dart';
import '../../domain/repositories/search_repository.dart';
import '../bloc/search_bloc.dart';
import 'layout/search_layout.dart';
import 'search_keyboard_binding.dart';
import 'sections/keyboard/search_keyboard_overlay.dart';

part 'search_screen_content.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc(
        searchRepository: context.read<SearchRepository>(),
      ),
      child: const _SearchScreenView(),
    );
  }
}

class _SearchScreenView extends HookWidget {
  const _SearchScreenView();

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    final tabsNode = useFocusScopeNode(debugLabel: 'search tabs');
    final inputNode = useFocusScopeNode(debugLabel: 'search input');
    final channelSuggestionsNode = useFocusScopeNode(
      debugLabel: 'search channel suggestions',
    );
    final categorySuggestionsNode = useFocusScopeNode(
      debugLabel: 'search category suggestions',
    );
    final tagSuggestionsNode = useFocusScopeNode(
      debugLabel: 'search tag suggestions',
    );
    final statusNode = useFocusScopeNode(
      debugLabel: 'search suggestions status',
    );
    final keyboardNode = useFocusScopeNode(debugLabel: 'search keyboard');
    final keyboardBinding = useMemoized(
      () => SearchKeyboardBinding(searchBloc),
      [searchBloc],
    );
    final handledNavigationSerial = useRef(0);

    useEffect(
      () {
        searchBloc.add(const SearchEvent.inputSelected());
        return keyboardBinding.dispose;
      },
      [keyboardBinding, searchBloc],
    );

    return BlocConsumer<SearchBloc, SearchState>(
      listenWhen: (previous, current) {
        return previous.isKeyboardOpen != current.isKeyboardOpen ||
            previous.query != current.query ||
            previous.navigationSerial != current.navigationSerial;
      },
      buildWhen: _shouldRebuildSearchScreen,
      listener: (context, state) {
        if (state.isKeyboardOpen) {
          keyboardBinding.sync(state);
        } else {
          keyboardBinding.closeKeyboard();
        }

        final request = state.navigationRequest;
        if (request != null &&
            request.serial != handledNavigationSerial.value) {
          handledNavigationSerial.value = request.serial;
          _openResult(context, request);
        }
      },
      builder: (context, state) {
        final keyboardCubit = keyboardBinding.cubit;

        return AppShellContentBackScope(
          controller: TvBackController(
            onBack: () {
              final navigationNode = AppShellFocusScope.maybeNavigationOf(
                context,
              );
              if (navigationNode?.hasFocus ?? false) {
                return;
              }

              if (state.isKeyboardOpen) {
                searchBloc.add(const SearchEvent.keyboardClosed());
                _requestFirstFocusable(inputNode);
                return;
              }

              if (tabsNode.hasFocus) {
                if (navigationNode != null) {
                  _requestFirstFocusable(navigationNode);
                }
                return;
              }

              _requestFirstFocusable(tabsNode);
            },
          ),
          child: _searchScreenContent(
            searchBloc: searchBloc,
            state: state,
            tabsNode: tabsNode,
            inputNode: inputNode,
            channelSuggestionsNode: channelSuggestionsNode,
            categorySuggestionsNode: categorySuggestionsNode,
            tagSuggestionsNode: tagSuggestionsNode,
            statusNode: statusNode,
            keyboardNode: keyboardNode,
            keyboardCubit: keyboardCubit,
          ),
        );
      },
    );
  }

  void _openResult(BuildContext context, SearchNavigationRequest request) {
    final route = switch (request.target) {
      SearchNavigationTarget.searchResults => AppRoute.searchResults,
      SearchNavigationTarget.searchTagResults => AppRoute.searchTagResults,
    };

    unawaited(
      context.pushNamed(
        route.name,
        queryParameters: {'keyword': request.query},
      ),
    );
  }
}

bool _shouldRebuildSearchScreen(SearchState previous, SearchState current) {
  return previous.copyWith(navigationRequest: null, navigationSerial: 0) !=
      current.copyWith(navigationRequest: null, navigationSerial: 0);
}

void _requestFirstFocusable(FocusScopeNode node) {
  final rememberedChild = node.focusedChild;
  if (rememberedChild != null && rememberedChild.canRequestFocus) {
    rememberedChild.requestFocus();
    return;
  }

  for (final descendant in node.traversalDescendants) {
    if (descendant.canRequestFocus) {
      descendant.requestFocus();
      return;
    }
  }

  node.requestFocus();
}
