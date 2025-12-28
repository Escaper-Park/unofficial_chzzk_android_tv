import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../../../common/widgets/toast/toast_service.dart';
import '../model/channel.dart';
import '../repository/channel_repository_wrapper.dart';

part 'channel_controller.g.dart';

@riverpod

/// Channel screen's current selected channel.
///
/// Uses Result pattern for proper error handling and provides
/// follow/unfollow functionality with error feedback.
class ChannelController extends _$ChannelController {
  @override
  FutureOr<Channel?> build({required String routeName}) async {
    return null;
  }

  /// Get channel and set current state using Result pattern.
  ///
  /// On success, updates state with channel data.
  /// On failure, logs the error and sets state to error.
  Future<void> setCurrentChannel({required String channelId}) async {
    state = const AsyncLoading();

    final wrapper = ref.read(channelRepositoryWrapperProvider);
    final result = await wrapper.getChannel(channelId: channelId);

    state = result.when(
      success: (channel) => AsyncData(channel),
      failure: (exception) {
        // Log errors for debugging
        assert(() {
          // ignore: avoid_print
          print(
            'ChannelController.setCurrentChannel error: ${exception.message}',
          );
          return true;
        }());

        // Return error state so UI can show error
        return AsyncError(exception, StackTrace.current);
      },
    );
  }

  /// Follows the current channel.
  ///
  /// Returns true if follow succeeded, false otherwise.
  /// On auth error, the UI should prompt for login.
  /// Shows toast feedback on success/failure.
  Future<bool> followChannel({required String channelId}) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);
    final toastService = ref.read(toastServiceProvider.notifier);
    final result = await wrapper.follow(channelId: channelId);

    return result.when(
      success: (_) {
        // Show success feedback
        toastService.showSuccess('팔로우했습니다');
        // Refresh channel data to update follow state
        _refreshChannelData(channelId);
        return true;
      },
      failure: (exception) {
        assert(() {
          // ignore: avoid_print
          print('ChannelController.followChannel error: ${exception.message}');
          return true;
        }());

        // Auth errors should prompt for login
        if (exception is AuthException) {
          toastService.showError('로그인이 필요합니다');
        } else {
          toastService.showError('팔로우에 실패했습니다');
        }

        return false;
      },
    );
  }

  /// Unfollows the current channel.
  ///
  /// Returns true if unfollow succeeded, false otherwise.
  /// Shows toast feedback on success/failure.
  Future<bool> unfollowChannel({required String channelId}) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);
    final toastService = ref.read(toastServiceProvider.notifier);
    final result = await wrapper.unFollow(channelId: channelId);

    return result.when(
      success: (_) {
        // Show success feedback
        toastService.showSuccess('팔로우를 해제했습니다');
        // Refresh channel data to update follow state
        _refreshChannelData(channelId);
        return true;
      },
      failure: (exception) {
        assert(() {
          // ignore: avoid_print
          print(
            'ChannelController.unfollowChannel error: ${exception.message}',
          );
          return true;
        }());
        toastService.showError('팔로우 해제에 실패했습니다');
        return false;
      },
    );
  }

  /// Refreshes channel data after follow/unfollow actions.
  void _refreshChannelData(String channelId) {
    // Fire and forget - silently refresh
    setCurrentChannel(channelId: channelId);
  }
}
