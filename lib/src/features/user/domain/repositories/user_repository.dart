import '../entities/user_status.dart';

abstract interface class UserRepository {
  Future<UserStatus> getUserStatus();

  Future<List<String>> getPrivateUserBlocks();
}
