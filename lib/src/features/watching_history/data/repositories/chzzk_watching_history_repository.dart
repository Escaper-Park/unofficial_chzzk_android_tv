import '../../../../core/network/network.dart';
import '../../domain/entities/watching_history.dart';
import '../../domain/failures/watching_history_failure.dart';
import '../../domain/repositories/watching_history_repository.dart';
import '../data_sources/watching_history_api.dart';
import '../data_sources/watching_history_api_contract.dart';
import '../mappers/watching_history_mapper.dart';

final class ChzzkWatchingHistoryRepository
    implements WatchingHistoryRepository {
  const ChzzkWatchingHistoryRepository({
    required this.api,
  });

  final WatchingHistoryApi api;

  @override
  Future<WatchingHistoryPage> fetchWatchingHistory({
    int? size,
    WatchingHistoryCursor? cursor,
  }) async {
    try {
      final response = await api.getWatchingHistory(
        size: size ?? WatchingHistoryApiDefaults.pageSize,
        lastTime: cursor?.lastTime,
      );
      final content = response.requireContent();

      return watchingHistoryPageFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const WatchingHistoryLoadFailure(),
        stackTrace,
      );
    }
  }
}
