import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../../domain/entities/search_results.dart';
import '../../domain/repositories/search_results_repository.dart';
import '../bloc/search_results_bloc.dart';
import 'layout/search_results_layout.dart';
import 'sections/header/search_results_header.dart';
import 'sections/shared/search_results_card_mapper.dart';

part 'search_results_screen_content.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({
    super.key,
    required this.query,
  });

  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey(query),
      create: (context) => SearchResultsBloc(
        repository: context.read<SearchResultsRepository>(),
      )..add(SearchResultsEvent.started(query: query)),
      child: const _SearchResultsScreenView(),
    );
  }
}

class _SearchResultsScreenView extends HookWidget {
  const _SearchResultsScreenView();

  @override
  Widget build(BuildContext context) {
    final channelRailNode = useFocusScopeNode(
      debugLabel: 'search results channel rail',
    );
    final liveRailNode = useFocusScopeNode(
      debugLabel: 'search results live rail',
    );
    final vodRailNode = useFocusScopeNode(
      debugLabel: 'search results vod rail',
    );
    final stateNode = useFocusScopeNode(
      debugLabel: 'search results state',
    );

    return BlocBuilder<SearchResultsBloc, SearchResultsState>(
      builder: (context, state) {
        return TvScaffold(
          backController: TvBackController(
            onBack: () => _popOrSearch(context),
          ),
          body: _searchResultsScreenContent(
            context: context,
            state: state,
            channelRailNode: channelRailNode,
            liveRailNode: liveRailNode,
            vodRailNode: vodRailNode,
            stateNode: stateNode,
          ),
        );
      },
    );
  }
}

void _popOrSearch(BuildContext context) {
  if (context.canPop()) {
    context.pop();
    return;
  }

  context.go(AppRoute.search.path);
}
