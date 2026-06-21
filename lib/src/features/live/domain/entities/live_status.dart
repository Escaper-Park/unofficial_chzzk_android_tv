import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_status.freezed.dart';

@freezed
abstract class LiveStatus with _$LiveStatus {
  const factory LiveStatus({
    required String title,
    required String status,
    required int concurrentUserCount,
    required bool adult,
    String? openDate,
    String? chatChannelId,
    @Default(<String>[]) List<String> tags,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    @Default(false) bool krOnlyViewing,
    @Default(false) bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
    @Default(<String>[]) List<String> liveTokens,
  }) = _LiveStatus;
}
