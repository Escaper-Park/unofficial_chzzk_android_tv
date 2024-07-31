import 'package:freezed_annotation/freezed_annotation.dart';

import '../../user/model/user.dart';

part 'mission.freezed.dart';
part 'mission.g.dart';

@freezed
class Mission with _$Mission {
  const factory Mission({
    required String missionDonationId,
    required String missionText,
    required String channelId,
    required String missionType,
    required int amount,
    required int failCheeringRate,
    required String status,
    required int missionDurationTime,
    required String missionStartTime,
    required String missionEndTime,
    required String createdTime,
    required User? user,
    required String? channel,
    required bool anonymous,
    required Object? createdBadge,
  }) = _Mission;

  factory Mission.fromJson(Map<String, dynamic> json) =>
      _$MissionFromJson(json);
}
