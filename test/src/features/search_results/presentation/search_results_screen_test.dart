import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/entities/search_results.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/domain/repositories/search_results_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/search_results/presentation/view/search_results_screen.dart';

void main() {
  testWidgets('reloads results when the query changes at the same route slot', (
    tester,
  ) async {
    final repository = _RecordingSearchResultsRepository();

    await tester.pumpWidget(
      _Harness(query: 'first', repository: repository),
    );
    await _pumpUntil(tester, () => repository.channelKeywords.length == 1);

    await tester.pumpWidget(
      _Harness(query: 'second', repository: repository),
    );
    await _pumpUntil(tester, () => repository.channelKeywords.length == 2);

    expect(repository.channelKeywords, ['first', 'second']);
    expect(repository.liveKeywords, ['first', 'second']);
    expect(repository.videoKeywords, ['first', 'second']);
  });
}

class _Harness extends StatelessWidget {
  const _Harness({
    required this.query,
    required this.repository,
  });

  final String query;
  final SearchResultsRepository repository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<SearchResultsRepository>.value(
      value: repository,
      child: MaterialApp(
        home: SearchResultsScreen(query: query),
      ),
    );
  }
}

final class _RecordingSearchResultsRepository
    implements SearchResultsRepository {
  final channelKeywords = <String>[];
  final liveKeywords = <String>[];
  final videoKeywords = <String>[];

  @override
  Future<SearchChannelResultsPage> searchChannels({
    required String keyword,
    int? size,
    bool? withFirstChannelContent,
    SearchCursor? cursor,
  }) async {
    channelKeywords.add(keyword);
    return const SearchChannelResultsPage();
  }

  @override
  Future<SearchLiveResultsPage> searchLives({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    liveKeywords.add(keyword);
    return const SearchLiveResultsPage();
  }

  @override
  Future<SearchVideoResultsPage> searchVideos({
    required String keyword,
    int? size,
    SearchCursor? cursor,
  }) async {
    videoKeywords.add(keyword);
    return const SearchVideoResultsPage();
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
