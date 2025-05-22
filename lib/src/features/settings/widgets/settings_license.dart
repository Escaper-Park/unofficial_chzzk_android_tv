import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/enums.dart' show DpadAction;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show CenteredText, FocusedOutlinedButton, HeaderText;

class CustomLicensePage extends HookWidget {
  const CustomLicensePage({
    super.key,
    required this.licenseData,
    required this.settingMenuFSN,
    required this.licenseListViewFSN,
    required this.licenseDetailFSN,
  });

  final LicenseData licenseData;

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode licenseListViewFSN;
  final FocusScopeNode licenseDetailFSN;

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState<int>(0);

    final packages = licenseData.packages;
    final entry = licenseData.licenses[currentIndex.value];

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: Dimensions.licenseHeaderHegith,
            child: CenteredText(text: 'Powered by Flutter'),
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.licenseListWidth,
                  child: CustomLicenseList(
                    packages: packages,
                    settingMenuFSN: settingMenuFSN,
                    licenseListViewFSN: licenseListViewFSN,
                    licenseDetailFSN: licenseDetailFSN,
                    onPressed: (index) {
                      if (currentIndex.value != index) {
                        currentIndex.value = index;
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomLicenseDetail(
                    package: packages[currentIndex.value],
                    entry: entry,
                    licenseListViewFSN: licenseListViewFSN,
                    licenseDetailFSN: licenseDetailFSN,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomLicenseList extends StatelessWidget {
  const CustomLicenseList({
    super.key,
    required this.packages,
    required this.settingMenuFSN,
    required this.licenseListViewFSN,
    required this.licenseDetailFSN,
    required this.onPressed,
  });

  final List<String> packages;

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode licenseListViewFSN;
  final FocusScopeNode licenseDetailFSN;

  final void Function(int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return DpadListView(
      scrollDirection: Axis.vertical,
      itemList: packages,
      listViewFSN: licenseListViewFSN,
      leftFSN: settingMenuFSN,
      rightFSN: licenseDetailFSN,
      itemBuilder: (index, focusNode, object) {
        return FocusedOutlinedButton(
          autofocus: index == 0,
          padding: const EdgeInsets.all(10.0),
          onPressed: () => onPressed(index),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Text(
              packages[index],
              style: TextStyle(
                fontSize: 11.0,
                color: AppColors.whiteColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomLicenseDetail extends HookWidget {
  const CustomLicenseDetail({
    super.key,
    required this.package,
    required this.entry,
    required this.licenseListViewFSN,
    required this.licenseDetailFSN,
  });

  final String package;
  final LicenseEntry entry;

  final FocusScopeNode licenseListViewFSN;
  final FocusScopeNode licenseDetailFSN;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final bindings = createScrollBindings(scrollController);
    final text = entry.paragraphs.map((paragraph) => paragraph.text).join("\n");

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DpadFocusScopeNavigator(
        node: licenseDetailFSN,
        dpadKeyNodeMap: {DpadAction.arrowLeft: licenseListViewFSN},
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              HeaderText(text: package, fontSize: 16.0),
              // const Divider(),
              DpadActionWidget(
                autofocus: true,
                useKeyRepeatEvent: true,
                useFocusedBorder: true,
                dpadActionCallbacks: bindings,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LicenseData {
  final List<LicenseEntry> licenses = <LicenseEntry>[];
  final Map<String, List<int>> packageLicenseBindings = <String, List<int>>{};
  final List<String> packages = <String>[];

  String? firstPackage;

  void addLicense(LicenseEntry entry) {
    for (final String package in entry.packages) {
      _addPackage(package);

      packageLicenseBindings[package]!.add(licenses.length);
    }
    licenses.add(entry);
  }

  void _addPackage(String package) {
    if (!packageLicenseBindings.containsKey(package)) {
      packageLicenseBindings[package] = <int>[];
      firstPackage ??= package;
      packages.add(package);
    }
  }

  void sortPackages([int Function(String a, String b)? compare]) {
    packages.sort(
      compare ??
          (String a, String b) {
            if (a == firstPackage) {
              return -1;
            }
            if (b == firstPackage) {
              return 1;
            }
            return a.toLowerCase().compareTo(b.toLowerCase());
          },
    );
  }
}
