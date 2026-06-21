part of 'home_layout.dart';

extension _HomeLayoutSections on HomeLayout {
  Widget _buildSection(
    int index, {
    required int immersiveActiveIndex,
    required FocusNode immersiveActionNode,
    required LivePreviewStateListenable? immersivePreviewState,
    required ValueChanged<int> onImmersiveActiveIndexChanged,
  }) {
    final sectionId = state.visibleSections[index];
    final up = index == 0
        ? null
        : focusRegistry.nodeFor(state.visibleSections[index - 1]);
    final down = index == state.visibleSections.length - 1
        ? null
        : focusRegistry.nodeFor(state.visibleSections[index + 1]);
    final node = focusRegistry.nodeFor(sectionId);
    final autofocus = index == 0;

    return switch (sectionId) {
      HomeSectionId.immersive => _buildImmersiveSection(
        node: node,
        up: up,
        down: down,
        immersiveActiveIndex: immersiveActiveIndex,
        immersiveActionNode: immersiveActionNode,
        previewState: immersivePreviewState,
        onImmersiveActiveIndexChanged: onImmersiveActiveIndexChanged,
        autofocus: autofocus,
      ),
      HomeSectionId.followingLive => HomeLiveRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.followingLive,
        previewSettings: LivePreviewSettings.liveCard(state.generalSetting),
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onLivePressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
      HomeSectionId.popularLive => HomeLiveRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.popularLive,
        previewSettings: LivePreviewSettings.liveCard(state.generalSetting),
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onLivePressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
      HomeSectionId.watchingHistory => HomeVodRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.watchingHistory,
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onVodPressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
      HomeSectionId.popularVod => HomeVodRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.popularVod,
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onVodPressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
      HomeSectionId.followingCategory => HomeCategoryRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.followingCategory,
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onCategoryPressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
      HomeSectionId.trendingCategory => HomeCategoryRailSection(
        sectionId: sectionId,
        node: node,
        up: up,
        down: down,
        data: state.trendingCategory,
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onCategoryPressed,
        onMorePressed: () => onSectionMorePressed(sectionId),
      ),
    };
  }

  Widget _buildImmersiveSection({
    required FocusScopeNode node,
    required FocusScopeNode? up,
    required FocusScopeNode? down,
    required int immersiveActiveIndex,
    required FocusNode immersiveActionNode,
    required LivePreviewStateListenable? previewState,
    required ValueChanged<int> onImmersiveActiveIndexChanged,
    required bool autofocus,
  }) {
    Widget buildSection(double? actionProgress) {
      return HomeImmersiveSection(
        node: node,
        up: up,
        down: down,
        data: state.immersive,
        activeIndex: immersiveActiveIndex,
        onActiveIndexChanged: onImmersiveActiveIndexChanged,
        actionFocusNode: immersiveActionNode,
        actionProgress: actionProgress,
        autofocus: autofocus,
        onRetry: onRetry,
        onItemPressed: onLivePressed,
      );
    }

    if (previewState == null) {
      return buildSection(null);
    }

    return ValueListenableBuilder<LivePreviewState>(
      valueListenable: previewState,
      builder: (context, state, _) => buildSection(state.waitProgress),
    );
  }

  Live? _activeImmersiveItem(int activeIndex) {
    if (!state.visibleSections.contains(HomeSectionId.immersive) ||
        state.immersive.status != HomeSectionLoadStatus.ready ||
        state.immersive.items.isEmpty) {
      return null;
    }

    final items = state.immersive.items;
    final effectiveIndex = activeIndex >= items.length
        ? items.length - 1
        : activeIndex;

    return items[effectiveIndex];
  }
}
