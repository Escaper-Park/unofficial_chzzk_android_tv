import 'package:flutter/widgets.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../bloc/home_bloc.dart';
import '../../../home_screen_design.dart';
import '../../../home_screen_string.dart';
import '../../../home_screen_ui_mapper.dart';
import 'home_section_header.dart';

class HomeSectionStateView extends StatelessWidget {
  const HomeSectionStateView({
    super.key,
    required this.sectionId,
    required this.status,
    required this.node,
    required this.height,
    required this.onRetry,
    this.up,
    this.down,
    this.showTitle = true,
    this.autofocus = false,
  });

  final HomeSectionId sectionId;
  final HomeSectionLoadStatus status;
  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final double height;
  final VoidCallback onRetry;
  final bool showTitle;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      upFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
      downFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
      upEnsureVisibleScope: up != null,
      downEnsureVisibleScope: down != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle) ...[
            HomeSectionHeader(title: homeSectionTitle(sectionId)),
            const SizedBox(height: HomeScreenDesign.sectionTitleBottomGap),
          ],
          SizedBox(
            height: height,
            child: _content,
          ),
        ],
      ),
    );
  }

  Widget get _content {
    return switch (status) {
      HomeSectionLoadStatus.initial ||
      HomeSectionLoadStatus.loading => const ContentStateView.loading(
        message: null,
      ),
      HomeSectionLoadStatus.failure => ContentStateView.error(
        message: HomeScreenString.sectionLoadFailed,
        action: TvButton.label(
          text: HomeScreenString.retry,
          autofocus: autofocus,
          onPressed: onRetry,
        ),
      ),
      HomeSectionLoadStatus.ready => ContentStateView.empty(
        message: homeSectionEmptyMessage(sectionId),
        action: TvButton.label(
          text: HomeScreenString.retry,
          autofocus: autofocus,
          onPressed: onRetry,
        ),
      ),
    };
  }
}
