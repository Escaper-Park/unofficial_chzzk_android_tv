import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute;
import '../../common/widgets/screen/adaptive_grid_view/fetch_more_state_indicator.dart';
import 'custom_formatter.dart';

extension DimensionsX on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
}

extension ImageCacheX on num {
  /// Use imageWidth.cacheSize(context), imageHeight.cacheSize(context) or both
  int cacheSize(BuildContext context) =>
      (this * MediaQuery.of(context).devicePixelRatio).round();
}

extension NavigatorX on BuildContext {
  void goTo({
    required BuildContext context,
    required AppRoute currentLocation,
    required AppRoute appRoute,
    Map<String, dynamic>? extra,
    Map<String, String> pathParameters = const {},
  }) {
    if (context.mounted && currentLocation != appRoute) {
      context.goNamed(
        appRoute.routeName,
        extra: extra,
        pathParameters: pathParameters,
      );
    }
  }

  void pushTo({
    required BuildContext context,
    required AppRoute currentLocation,
    required AppRoute appRoute,
    Map<String, dynamic>? extra,
    Map<String, String> pathParameters = const {},
  }) {
    if (context.mounted && currentLocation != appRoute) {
      context.pushNamed(
        appRoute.routeName,
        extra: extra,
        pathParameters: pathParameters,
      );
    }
  }
}

extension DurationX on Duration {
  String paddedDuration() =>
      CustomFormatter.formatDurationToPaddedTimeStr(this);
}

extension IntTimeX on int {
  String commaFormat() => CustomFormatter.formatIntToCommaStr(this);
  String timestampToHHmm() => CustomFormatter.formatTimestampToTimeStr(this);
  String playerMessageTimeToHms() =>
      CustomFormatter.formatPlayerMessageTimeToHms(this);
}

extension FetchMoreIndicatorX on Ref {
  void setFetchMoreLoading(String screenId, bool isLoading) {
    read(FetchMoreStateIndicatorControllerProvider(screenId: screenId).notifier)
        .setState(isLoading);
  }
}

extension AppRouteX on AppRoute {
  // routeName으로 AppRoute 찾기
  static AppRoute? fromRouteName(String routeName) {
    try {
      return AppRoute.values.firstWhere(
        (route) => route.routeName == routeName,
      );
    } catch (_) {
      return null;
    }
  }
}
