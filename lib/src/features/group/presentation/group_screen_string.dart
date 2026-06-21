import 'models/group_screen_models.dart';

abstract final class GroupScreenString {
  static const groupsTitle = '그룹';
  static const selectedGroupTitle = '그룹 상세';
  static const createInputHint = '생성하려는 그룹 이름을 입력해주세요';
  static const createAction = '그룹 만들기';
  static const groupsEmpty = '아직 그룹이 없습니다';
  static const noSelectedGroup = '먼저 그룹을 선택해주세요';
  static const activateGroup = '활성 그룹으로 사용';
  static const activeGroup = '활성';
  static const addMember = '채널 추가';
  static const deleteGroup = '그룹 삭제';
  static const watchLive = '라이브 보기';
  static const moveToChannel = '채널로 이동';
  static const removeFromGroup = '그룹에서 제거';
  static const emptyName = '그룹 이름을 입력하세요';
  static const groupCreated = '그룹을 만들었습니다';
  static const createFailed = '그룹을 만들지 못했습니다';
  static const groupDeleted = '그룹을 삭제했습니다';
  static const deleteFailed = '그룹을 삭제하지 못했습니다';
  static const groupActivated = '활성 그룹을 변경했습니다';
  static const activateFailed = '활성 그룹을 변경하지 못했습니다';
  static const duplicateName = '이미 같은 이름의 그룹이 있습니다';
  static const memberRemoved = '채널을 그룹에서 제거했습니다';
  static const memberRemoveFailed = '채널을 그룹에서 제거하지 못했습니다';
  static const loadFailed = '그룹을 불러오지 못했습니다';
  static const retry = '다시 시도';
  static const confirmDeleteTitle = '그룹 삭제';
  static const confirmDeletePrimary = '삭제';
  static const confirmDeleteSecondary = '취소';
  static const confirmRemoveTitle = '채널 제거';
  static const confirmRemovePrimary = '제거';
  static const confirmRemoveSecondary = '취소';

  static String tabLabel(GroupTab tab) {
    return switch (tab) {
      GroupTab.group => '그룹',
      GroupTab.create => '그룹 만들기',
    };
  }

  static String confirmDeleteContent(String groupName) {
    return '"$groupName" 그룹을 삭제할까요?';
  }

  static String confirmRemoveContent(String channelName, String groupName) {
    return '"$channelName" 채널을 "$groupName" 그룹에서 제거할까요?';
  }
}
