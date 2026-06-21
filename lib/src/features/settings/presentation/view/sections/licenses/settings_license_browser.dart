import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../settings_screen_design.dart';
import 'settings_license_content_pane.dart';
import 'settings_license_loader.dart';

class SettingsLicenseBrowser extends HookWidget {
  const SettingsLicenseBrowser({
    super.key,
    required this.licenses,
  });

  final List<SettingsLicenseItem> licenses;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    final packageNode = useFocusScopeNode(
      debugLabel: 'settings licenses packages',
    );
    final contentNode = useFocusScopeNode(
      debugLabel: 'settings licenses content',
    );
    final contentFocusNode = useFocusNode(
      debugLabel: 'settings licenses content first',
    );
    final packageFocusNodes = useMemoized(
      () => [
        for (var index = 0; index < licenses.length; index += 1)
          FocusNode(debugLabel: 'settings license package $index'),
      ],
      [licenses.length],
    );

    useEffect(() {
      return () {
        for (final node in packageFocusNodes) {
          node.dispose();
        }
      };
    }, [packageFocusNodes]);

    useEffect(() {
      final listeners = <VoidCallback>[];
      for (var index = 0; index < packageFocusNodes.length; index += 1) {
        final node = packageFocusNodes[index];
        void listener() {
          if (node.hasFocus) {
            selectedIndex.value = index;
          }
        }

        listeners.add(listener);
        node.addListener(listener);
      }

      return () {
        for (var index = 0; index < packageFocusNodes.length; index += 1) {
          packageFocusNodes[index].removeListener(listeners[index]);
        }
      };
    }, [packageFocusNodes]);

    final effectiveIndex = selectedIndex.value
        .clamp(0, licenses.length - 1)
        .toInt();
    final selectedItem = licenses[effectiveIndex];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: SettingsScreenDesign.licensesListWidth,
          child: TvFocusSection.list(
            node: packageNode,
            right: contentNode,
            child: ListView.separated(
              key: const ValueKey('settings-license-package-list'),
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.symmetric(
                horizontal: SettingsScreenDesign.listHorizontalFocusBleed,
                vertical: SettingsScreenDesign.listVerticalFocusBleed,
              ),
              itemCount: licenses.length,
              separatorBuilder: (context, index) {
                return const SizedBox(height: SettingsScreenDesign.rowGap);
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: SettingsScreenDesign.licensesListRowHeight,
                  child: TvListItem(
                    key: ValueKey('settings-license-package-$index'),
                    title: licenses[index].title,
                    selected: index == effectiveIndex,
                    focusNode: packageFocusNodes[index],
                    autofocus: index == 0,
                    design: TvListItemDesign.dense(lineCount: 1),
                    onPressed: () {
                      selectedIndex.value = index;
                    },
                  ),
                );
              },
            ),
          ),
        ),
        const SizedBox(width: SettingsScreenDesign.licensesContentGap),
        Expanded(
          child: TvFocusSection.list(
            node: contentNode,
            left: packageNode,
            child: SettingsLicenseContentPane(
              key: ValueKey('settings-license-content-pane-$effectiveIndex'),
              item: selectedItem,
              focusNode: contentFocusNode,
            ),
          ),
        ),
      ],
    );
  }
}
