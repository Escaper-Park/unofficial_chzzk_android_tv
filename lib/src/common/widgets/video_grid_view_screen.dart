import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';
import './center_widgets.dart';
import './dpad_widgets.dart';
import './focused_widget.dart';
import './pop_scope_screen.dart';

class VideoGridViewScreen extends StatelessWidget {
  /// Video grid view screen with sidebar.
  ///
  /// This Wrapped by [PopScopeScreen] so add onPopInvoked.
  const VideoGridViewScreen({
    super.key,
    required this.onPopInvoked,
    required this.headerWidget,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.followingButtonFSN,
    required this.sidebarItems,
    required this.loadingStateProvider,
    required this.videoGridView,
    this.crossAxisCount = 3,
    this.horizontalPadding = 20.0,
    this.crossAxisSpacing = 5.0,
    this.containerWidth = Dimensions.videoContainerWidth,
  });

  final void Function(bool _, dynamic __) onPopInvoked;

  /// Top side of screen.
  final Widget headerWidget;

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? followingButtonFSN;

  final List<VideoScreenSidebarItem> sidebarItems;

  /// Show fetch more state.
  final ProviderListenable<bool> loadingStateProvider;

  /// Depends on the list items.
  final Widget videoGridView;

  final int crossAxisCount;
  final double horizontalPadding;
  final double crossAxisSpacing;
  final double containerWidth;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double totalHPadding = horizontalPadding * 2;
    final double totalSpacing = crossAxisSpacing * 2 * (crossAxisCount - 1);
    final double totalContainerWidth = containerWidth * crossAxisCount;

    final double sidebarWidth =
        screenWidth - totalHPadding - totalSpacing - totalContainerWidth;

    return PopScopeScreen(
      onPopInvokedWithResult: onPopInvoked,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            headerWidget,
            // sidebar and gridview
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sidebar
                  SizedBox(
                    width: sidebarWidth,
                    child: VideoScreenSidebar(
                      horizontalPadding: horizontalPadding,
                      sidebarFSN: sidebarFSN,
                      gridViewFSN: gridViewFSN,
                      followingButtonFSN: followingButtonFSN,
                      loadingStateProvider: loadingStateProvider,
                      sidebarItems: sidebarItems,
                    ),
                  ),
                  // video gridview
                  Expanded(child: videoGridView)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoGridViewWithAsyncValue<T> extends HookWidget {
  /// GridView of video container.
  const VideoGridViewWithAsyncValue({
    super.key,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 10.0,
    this.mainAxisSpacing = 10.0,
    this.mainAxisExtent = Dimensions.videoContainerHeight,
    required this.asyncValue,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.followingButtonFSN,
    required this.emptyText,
    required this.errorText,
    this.fetchMore,
    required this.itemBuilder,
  });

  /// Number of videos in a row.
  final int crossAxisCount;

  /// Horizontal padding of video Container.
  final double crossAxisSpacing;

  /// Vertical padding of video Container.
  final double mainAxisSpacing;

  /// Container height,
  final double mainAxisExtent;

  /// A List of AsyncValue of T.
  final AsyncValue<List<T>?> asyncValue;

  /// Video list FocusScopeNode.
  final FocusScopeNode gridViewFSN;

  /// Sidebar's FocusScopeNode.
  final FocusScopeNode sidebarFSN;

  /// Use it in Category video screen to follow a category.
  final FocusScopeNode? followingButtonFSN;

  final String emptyText;
  final String errorText;

  /// Fetch more videos.
  ///
  /// Use it with a controller.
  final VoidCallback? fetchMore;

  /// Widget builder.
  final Widget Function(BuildContext context, int index, T object) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncData(:final value) => VideoGridView<T>(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          mainAxisExtent: mainAxisExtent,
          videoList: value,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          followingButtonFSN: followingButtonFSN,
          fetchMore: fetchMore,
          emptyText: emptyText,
          itemBuilder: (context, index) {
            final object = value![index];

            return itemBuilder(context, index, object);
          },
        ),
      AsyncError() => CenteredText(text: errorText),
      _ => const SizedBox.shrink(),
    };
  }
}

class VideoGridView<T> extends HookWidget {
  const VideoGridView({
    super.key,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 10.0,
    this.mainAxisSpacing = 10.0,
    this.mainAxisExtent = Dimensions.videoContainerHeight,
    this.fetchMore,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.followingButtonFSN,
    required this.emptyText,
    required this.videoList,
    required this.itemBuilder,
  });

  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double mainAxisExtent;

  final VoidCallback? fetchMore;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? followingButtonFSN;
  final String emptyText;
  final List<T>? videoList;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      scrollController.addListener(() async {
        // -mainAxisSpacing: damping
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent - mainAxisSpacing &&
            !scrollController.position.outOfRange) {
          if (fetchMore != null) fetchMore!();
        }
      });
      return null;
    }, [scrollController]);

    return (videoList == null || videoList!.isEmpty)
        ? CenteredText(text: emptyText)
        : FocusScope(
            node: gridViewFSN,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              controller: scrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: crossAxisSpacing,
                mainAxisExtent: mainAxisExtent,
                mainAxisSpacing: mainAxisSpacing,
              ),
              itemCount: videoList!.length,
              itemBuilder: (context, index) {
                ShortcutsBindings bindings = {};

                // Move focus left side or top side items to sidebar or header.
                // Top left
                if (index == 0) {
                  bindings = {
                    const SingleActivator(LogicalKeyboardKey.arrowLeft):
                        sidebarFSN.requestFocus,
                    const SingleActivator(LogicalKeyboardKey.arrowUp): () {
                      if (followingButtonFSN != null) {
                        followingButtonFSN?.requestFocus();
                      }
                    }
                  };
                }
                // Top side
                else if (index < crossAxisCount) {
                  bindings = {
                    const SingleActivator(LogicalKeyboardKey.arrowUp): () {
                      if (followingButtonFSN != null) {
                        followingButtonFSN?.requestFocus();
                      }
                    }
                  };
                }
                // Left side
                else if (index % crossAxisCount == 0) {
                  bindings = {
                    const SingleActivator(LogicalKeyboardKey.arrowLeft):
                        sidebarFSN.requestFocus
                  };
                } else {
                  bindings = {};
                }

                return CallbackShortcuts(
                  bindings: bindings,
                  child: itemBuilder(context, index),
                );
              },
            ),
          );
  }
}

typedef VideoScreenSidebarItem = (String, VoidCallback);

class VideoScreenSidebar extends HookWidget {
  /// Sidebar of video gridview screen to select sortType
  /// and show fetch more loading state.
  const VideoScreenSidebar({
    super.key,
    required this.horizontalPadding,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.followingButtonFSN,
    required this.loadingStateProvider,
    required this.sidebarItems,
  });

  final double horizontalPadding;

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? followingButtonFSN;

  /// Show loading state when do fetch more.
  final ProviderListenable<bool> loadingStateProvider;

  /// Sidebar items with String and VoidCallback to select sortType.
  final List<VideoScreenSidebarItem> sidebarItems;

  @override
  Widget build(BuildContext context) {
    // Highlight current sortType.
    final currentItemIndex = useState<int>(0);

    final focusNodes = List.generate(
      sidebarItems.length,
      (_) => useFocusNode(),
    );

    return Padding(
      padding: EdgeInsets.only(right: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Add Expanded to seperate sidebar items from fetch more state
          Expanded(
            child: DpadFocusScopeNavigator(
              node: sidebarFSN,
              dpadKeyFocusScopeNodeMap: {DpadAction.arrowRight: gridViewFSN},
              onFocusChange: (value) {
                if (value) focusNodes[currentItemIndex.value].requestFocus();
              },
              child: ListView.builder(
                itemCount: sidebarItems.length,
                itemBuilder: (context, index) {
                  final item = sidebarItems[index];

                  return CallbackShortcuts(
                    bindings: index == 0
                        ? {
                            const SingleActivator(LogicalKeyboardKey.arrowUp):
                                () {
                              if (followingButtonFSN != null) {
                                followingButtonFSN?.requestFocus();
                              }
                            }
                          }
                        : {},
                    child: FocusedOutlinedButton(
                      autofocus: false,
                      focusNode: focusNodes[index],
                      padding: const EdgeInsets.all(10.0),
                      onPressed: () {
                        item.$2();
                        currentItemIndex.value = index;
                      },
                      child: (_) => CenteredText(
                        text: item.$1,
                        fontSize: 14.0,
                        overflow: TextOverflow.ellipsis,
                        fontColor: currentItemIndex.value == index
                            ? AppColors.chzzkColor
                            : AppColors.whiteColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Fetch More State
          Consumer(
            builder: (context, ref, child) {
              final loadingState = ref.watch(loadingStateProvider);

              return _SidebarFetchMoreStateIndicator(loadingState);
            },
          ),
        ],
      ),
    );
  }
}

class _SidebarFetchMoreStateIndicator extends StatelessWidget {
  /// Show fetch more state at the bottom of sidebar.
  const _SidebarFetchMoreStateIndicator(this.loadingState);

  final bool loadingState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(loadingState == true ? '로딩중...' : ' '),
    );
  }
}
