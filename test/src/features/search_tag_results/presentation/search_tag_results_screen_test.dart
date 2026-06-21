import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_sort.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/entities/search_tag_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/domain/repositories/search_tag_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_tag_results/presentation/view/search_tag_results_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_sort.dart';

void main() {
  testWidgets('reloads results when the tag changes at the same route slot', (
    tester,
  ) async {
    final repository = _RecordingSearchTagResultsRepository();

    await tester.pumpWidget(
      _Harness(tag: '#first', repository: repository),
    );
    await _pumpUntil(tester, () => repository.liveTags.length == 1);

    await tester.pumpWidget(
      _Harness(tag: '#second', repository: repository),
    );
    await _pumpUntil(tester, () => repository.liveTags.length == 2);

    expect(repository.liveTags, ['first', 'second']);
    expect(repository.videoTags, isEmpty);
  });
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.tag,
    required this.repository,
  });

  final String tag;
  final SearchTagResultsRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SearchTagResultsRepository>.value(
      value: repository,
      child: MaterialApp(
        home: SearchTagResultsScreen(tag: tag),
      ),
    );
  }
}

final class _RecordingSearchTagResultsRepository
    implements SearchTagResultsRepository {
  final liveTags = <String>[];
  final videoTags = <String>[];

  @override
  Future<SearchTagLivePage> searchTagLives({
    required String tag,
    int? size,
    LiveSort? sortType,
    SearchTagLiveCursor? cursor,
  }) async {
    liveTags.add(tag);
    return const SearchTagLivePage();
  }

  @override
  Future<SearchTagVideoPage> searchTagVideos({
    required String tag,
    int? size,
    VodSort? sortType,
    SearchTagVideoCursor? cursor,
  }) async {
    videoTags.add(tag);
    return const SearchTagVideoPage();
  }
}

Future<void> _pumpUntil(
  WidgetTester tester,
  bool Function() condition,
) async {
  for (var attempt = 0; attempt < 20; attempt += 1) {
    if (condition()) {
      return;
    }
    await tester.pump();
  }

  fail('Condition was not met.');
}
