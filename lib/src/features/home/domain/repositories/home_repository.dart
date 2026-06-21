import '../entities/home_live.dart';

// ignore: one_member_abstracts
abstract interface class HomeRepository {
  Future<List<HomeLive>> getTopLives({
    int? slotSize,
  });
}
