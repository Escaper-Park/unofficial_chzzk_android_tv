import '../../../../core/network/network.dart';
import '../../domain/entities/user_status.dart';
import '../../domain/failures/user_failure.dart';
import '../../domain/repositories/user_repository.dart';
import '../data_sources/user_api.dart';
import '../mappers/user_mapper.dart';

final class ChzzkUserRepository implements UserRepository {
  const ChzzkUserRepository({
    required this.api,
  });

  final UserApi api;

  @override
  Future<UserStatus> getUserStatus() async {
    try {
      final response = await api.getUserStatus();
      final content = response.requireContent();

      return userStatusFromDto(content);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const UserStatusLoadFailure(), stackTrace);
    }
  }

  @override
  Future<List<String>> getPrivateUserBlocks() async {
    try {
      final response = await api.getPrivateUserBlocks();
      final content = response.requireContent();

      return content;
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const PrivateUserBlocksLoadFailure(),
        stackTrace,
      );
    }
  }
}
