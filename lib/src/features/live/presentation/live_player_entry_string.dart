import '../domain/use_cases/check_live_player_entry.dart';

abstract final class LivePlayerEntryString {
  static const dialogTitle = '시청 제한';
  static const confirm = '확인';

  static String blockedContent(LivePlayerEntryBlockReason reason) {
    return switch (reason) {
      LivePlayerEntryBlockReason.closed => '종료된 방송입니다',
      LivePlayerEntryBlockReason.abroad => '현재 접속 국가에서는 시청할 수 없는 영상입니다',
      LivePlayerEntryBlockReason.restricted => '시청이 제한된 방송입니다',
      LivePlayerEntryBlockReason.adult =>
        '사용자 보호를 위해 연령 제한이 설정된 라이브입니다\n시청을 원하면 로그인 후 본인 인증을 완료해주세요',
      LivePlayerEntryBlockReason.membership =>
        '네이버플러스 멤버십 또는 치트키 유저만 시청할 수 있습니다',
    };
  }
}
