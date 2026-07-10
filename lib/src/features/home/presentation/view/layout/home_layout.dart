import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../app/shell/shell.dart';
import '../../../../../core/ui/ui.dart';
import '../../../../category/domain/entities/category_item.dart';
import '../../../../live/domain/entities/live_feed.dart';
import '../../../../live/presentation/view/shared/live_preview.dart';
import '../../../../live/presentation/view/shared/live_preview_player.dart';
import '../../../../live/presentation/view/shared/live_preview_settings.dart';
import '../../../../vod/domain/entities/vod_feed.dart';
import '../../bloc/home_bloc.dart';
import '../../home_screen_design.dart';
import '../sections/immersive/home_immersive_background.dart';
import '../sections/immersive/home_immersive_list_exports.dart';
import '../sections/immersive/home_immersive_section.dart';
import '../sections/rails/home_category_rail_section.dart';
import '../sections/rails/home_live_rail_section.dart';
import '../sections/rails/home_vod_rail_section.dart';
import '../shared/home_focus_registry.dart';

part 'home_layout_immersive_background.dart';
part 'home_layout_sections.dart';
part 'home_layout_section_wrappers.dart';

class HomeLayout extends HookWidget {
  const HomeLayout({
    super.key,
    required this.state,
    required this.focusRegistry,
    required this.onRetry,
    required this.onLivePressed,
    required this.onVodPressed,
    required this.onCategoryPressed,
    required this.onSectionMorePressed,
    this.scrollController,
  });

  final HomeState state;
  final HomeFocusRegistry focusRegistry;
  final ScrollController? scrollController;
  final VoidCallback onRetry;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;
  final ValueChanged<CategoryItem> onCategoryPressed;
  final ValueChanged<HomeSectionId> onSectionMorePressed;

  @override
  Widget build(BuildContext context) {
    final fallbackScrollController = useScrollController();
    final scrollController = this.scrollController ?? fallbackScrollController;
    final immersiveActiveIndex = useState(0);
    final immersiveActionNode = useFocusNode(
      debugLabel: 'home immersive action',
    );
    final immersiveNode = focusRegistry.nodeFor(HomeSectionId.immersive);
    final hasImmersiveBackdrop =
        state.visibleSections.contains(HomeSectionId.immersive) &&
        state.immersive.status == HomeSectionLoadStatus.ready &&
        state.immersive.items.isNotEmpty;
    final activeImmersiveItem = _activeImmersiveItem(
      immersiveActiveIndex.value,
    );

    useEffect(() {
      var isActive = true;

      void notifyNavigationBackdrop() {
        if (!isActive || !context.mounted) {
          return;
        }

        AppShellNavigationBackdropNotification(
          translucent: hasImmersiveBackdrop && immersiveNode.hasFocus,
        ).dispatch(context);
      }

      immersiveNode.addListener(notifyNavigationBackdrop);
      scheduleMicrotask(notifyNavigationBackdrop);
      return () {
        isActive = false;
        immersiveNode.removeListener(notifyNavigationBackdrop);
      };
    }, [hasImmersiveBackdrop, immersiveNode]);

    Widget buildLayout(LivePreviewStateListenable? previewState) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          _buildHomeImmersiveBackground(
            state: state,
            activeIndex: immersiveActiveIndex.value,
            scrollController: scrollController,
            previewState: previewState,
          ),
          SingleChildScrollView(
            controller: scrollController,
            clipBehavior: Clip.none,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: HomeScreenDesign.scrollBottomPadding,
              ),
              child: Column(
                children: [
                  const SizedBox(height: HomeImmersiveListDesign.shellOverlap),
                  for (
                    var index = 0;
                    index < state.visibleSections.length;
                    index++
                  )
                    _HomeSectionSpacing(
                      addTopGap: index > 0,
                      child: _HomeAutoScrollSection(
                        node: focusRegistry.nodeFor(
                          state.visibleSections[index],
                        ),
                        child: _buildSection(
                          index,
                          immersiveActiveIndex: immersiveActiveIndex.value,
                          immersiveActionNode: immersiveActionNode,
                          immersivePreviewState: previewState,
                          onImmersiveActiveIndexChanged: (index) {
                            immersiveActiveIndex.value = index;
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    if (activeImmersiveItem == null) {
      return buildLayout(null);
    }

    return LivePreviewListenable(
      item: activeImmersiveItem,
      focusNode: immersiveActionNode,
      settings: LivePreviewSettings.immersive(state.generalSetting),
      settingsFromGeneralSetting: LivePreviewSettings.immersive,
      builder: (context, previewState) => buildLayout(previewState),
    );
  }
}
