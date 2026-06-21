import '../../../../core/network/network.dart';
import '../../domain/entities/home_live.dart';
import '../../domain/failures/home_failure.dart';
import '../../domain/repositories/home_repository.dart';
import '../data_sources/home_api.dart';
import '../data_sources/home_api_contract.dart';
import '../mappers/home_mapper.dart';

final class ChzzkHomeRepository implements HomeRepository {
  const ChzzkHomeRepository({
    required this.api,
  });

  final HomeApi api;

  @override
  Future<List<HomeLive>> getTopLives({
    int? slotSize,
  }) async {
    try {
      final response = await api.getMain(
        slotSize: slotSize ?? HomeApiDefaults.mainSlotSize,
      );
      final content = response.requireContent();

      return homeTopLivesFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const HomeTopLivesLoadFailure(), stackTrace);
    }
  }
}
