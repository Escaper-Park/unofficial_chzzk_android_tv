import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../utils/hooks/custom_hooks.dart';
import '../../../constants/enums.dart' show AppRoute, DpadAction;
import '../../../constants/styles.dart' show AppColors;
import '../../dpad/dpad_widgets.dart'
    show DpadCallbackShortcuts, ShortcutsBindings;
import '../../ui/ui_widgets.dart' show CenteredText, FocusedOutlinedButton;
import 'fetch_more_state_indicator.dart';

typedef GridViewSidebarItem = (String, void Function(int index));

class AdaptiveGridViewSidebar extends HookWidget {
  /// Sidebar to select sortType for [GridView].
  ///
  /// It shows the fetchmore state in the bottom of this.
  const AdaptiveGridViewSidebar({
    super.key,
    required this.baseRoute,
    required this.sidebarFSN,
    required this.gridViewFSN,
    required this.horizontalPadding,
    this.headerFSN,
    required this.sidebarItems,
  });

  /// Screen route that specifies the current screen to avoid
  /// duplicate controller usage.
  final AppRoute baseRoute;

  final double horizontalPadding;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? headerFSN;

  /// Sidebar items type of (String, VoidCallback) to select sortType.
  final List<GridViewSidebarItem> sidebarItems;

  @override
  Widget build(BuildContext context) {
    // to highlight current sortType.
    final currentSortTypeIndex = useState<int>(0);
    final focusNodes = useFocusNodes(sidebarItems.length);

    return Padding(
      padding: EdgeInsets.only(right: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: FocusScope(
              node: sidebarFSN,
              onFocusChange: (value) {
                if (value) {
                  focusNodes[currentSortTypeIndex.value].requestFocus();
                }
              },
              child: ListView.builder(
                itemCount: sidebarItems.length,
                itemBuilder: (context, index) {
                  final item = sidebarItems[index];

                  return DpadCallbackShortcuts(
                    dpadKeyNodeMap: {
                      DpadAction.arrowRight: gridViewFSN,
                      DpadAction.arrowUp: headerFSN,
                    },
                    bindings: _createBindings(index),
                    child: FocusedOutlinedButton(
                      autofocus: false,
                      padding: const EdgeInsets.all(10.0),
                      focusNode: focusNodes[index],
                      onPressed: () {
                        // callback
                        item.$2(index);
                        // change sortType index to highlight
                        currentSortTypeIndex.value = index;
                      },
                      child: CenteredText(
                        text: item.$1,
                        fontSize: 14.0,
                        overflow: TextOverflow.ellipsis,
                        fontColor: currentSortTypeIndex.value == index
                            ? AppColors.chzzkColor
                            : AppColors.whiteColor,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SidebarFetchMoreStateIndicator(screenId: baseRoute.routeName),
        ],
      ),
    );
  }

  ShortcutsBindings _createBindings(int index) {
    // base
    ShortcutsBindings bindings = {
      const SingleActivator(LogicalKeyboardKey.arrowRight): () {
        gridViewFSN.requestFocus();
      },
    };

    // request focus to header widget's FocusScopeNode
    if (index == 0) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowUp)] = () {
        headerFSN?.requestFocus();
      };
    }

    return bindings;
  }
}

/// Builds sidebar items, invoking onSelect with state and its index
List<GridViewSidebarItem> buildSidebarItems<T>(
  List<(String, T)> items,
  T current,
  void Function(T state, int index) onSelect,
) {
  return items.asMap().entries.map((entry) {
    final idx = entry.key;
    final (label, state) = entry.value;
    return (
      label,
      (selectedIndex) {
        if (state != current) onSelect(state, idx);
      }
    );
  }).toList();
}
