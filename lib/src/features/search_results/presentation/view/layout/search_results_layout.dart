import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/tv/focus/focus.dart';
import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/search_results.dart';
import '../../bloc/search_results_bloc.dart';
import '../../search_results_screen_design.dart';
import '../../search_results_screen_string.dart';
import '../../search_results_screen_ui_mapper.dart';
import '../sections/channel/search_results_channel_rail.dart';
import '../sections/live/search_results_live_rail.dart';
import '../sections/vod/search_results_vod_rail.dart';

part 'search_results_rails.dart';
part 'search_results_auto_scroll_section.dart';

class SearchResultsLayout extends StatelessWidget {
  const SearchResultsLayout({
    super.key,
    required this.state,
    required this.channelRailNode,
    required this.liveRailNode,
    required this.vodRailNode,
    required this.stateNode,
    required this.onRetry,
    required this.onChannelPressed,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final SearchResultsState state;
  final FocusScopeNode channelRailNode;
  final FocusScopeNode liveRailNode;
  final FocusScopeNode vodRailNode;
  final FocusScopeNode stateNode;
  final VoidCallback onRetry;
  final ValueChanged<SearchChannelResult> onChannelPressed;
  final ValueChanged<SearchLiveResult> onLivePressed;
  final ValueChanged<SearchVideoResult> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return switch (state.status) {
      SearchResultsLoadStatus.initial ||
      SearchResultsLoadStatus.loading => ContentStateView.loading(
        message: searchResultsLoadingMessage(),
      ),
      SearchResultsLoadStatus.failure => _FocusableStateView(
        stateNode: stateNode,
        child: ContentStateView.error(
          message: searchResultsErrorMessage(),
          action: TvButton.label(
            text: SearchResultsScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      SearchResultsLoadStatus.ready when state.isEmpty => _FocusableStateView(
        stateNode: stateNode,
        child: ContentStateView.empty(
          message: searchResultsEmptyMessage(),
          action: TvButton.label(
            text: SearchResultsScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      SearchResultsLoadStatus.ready => _SearchResultsRails(
        state: state,
        channelRailNode: channelRailNode,
        liveRailNode: liveRailNode,
        vodRailNode: vodRailNode,
        onChannelPressed: onChannelPressed,
        onLivePressed: onLivePressed,
        onVodPressed: onVodPressed,
      ),
    };
  }
}

class _FocusableStateView extends StatelessWidget {
  const _FocusableStateView({
    required this.stateNode,
    required this.child,
  });

  final FocusScopeNode stateNode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: stateNode,
      child: child,
    );
  }
}
