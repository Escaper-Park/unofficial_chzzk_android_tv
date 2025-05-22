import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fetch_more_state_indicator.g.dart';

class SidebarFetchMoreStateIndicator extends ConsumerWidget {
  const SidebarFetchMoreStateIndicator({super.key, required this.screenId});

  final String screenId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loadingState =
        ref.watch(fetchMoreStateIndicatorControllerProvider(screenId: screenId));

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(loadingState ? '로딩중...' : ' '),
    );
  }
}

@riverpod
class FetchMoreStateIndicatorController
    extends _$FetchMoreStateIndicatorController {
  /// Add screenId as key of this provider to avoid conflicts due to redundant usage.
  @override
  bool build({required String screenId}) {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
