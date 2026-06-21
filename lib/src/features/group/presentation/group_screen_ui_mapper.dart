import 'bloc/group_bloc.dart';
import 'group_screen_string.dart';

String groupFeedbackMessage(GroupFeedbackType feedbackType) {
  return switch (feedbackType) {
    GroupFeedbackType.emptyName => GroupScreenString.emptyName,
    GroupFeedbackType.duplicateName => GroupScreenString.duplicateName,
    GroupFeedbackType.createSuccess => GroupScreenString.groupCreated,
    GroupFeedbackType.createFailure => GroupScreenString.createFailed,
    GroupFeedbackType.deleteSuccess => GroupScreenString.groupDeleted,
    GroupFeedbackType.deleteFailure => GroupScreenString.deleteFailed,
    GroupFeedbackType.activateSuccess => GroupScreenString.groupActivated,
    GroupFeedbackType.activateFailure => GroupScreenString.activateFailed,
    GroupFeedbackType.memberRemoveSuccess => GroupScreenString.memberRemoved,
    GroupFeedbackType.memberRemoveFailure =>
      GroupScreenString.memberRemoveFailed,
  };
}
