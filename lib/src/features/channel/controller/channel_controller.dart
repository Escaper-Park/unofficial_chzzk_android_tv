import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
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
  Future<bool> followChannel({required String channelId}) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);
    final result = await wrapper.follow(channelId: channelId);

    return result.when(
      success: (_) {
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

        // Auth errors should be handled specially by the UI
        if (exception is AuthException) {
          // Could trigger a login prompt here
        }

        return false;
      },
    );
  }

  /// Unfollows the current channel.
  ///
  /// Returns true if unfollow succeeded, false otherwise.
  Future<bool> unfollowChannel({required String channelId}) async {
    final wrapper = ref.read(channelRepositoryWrapperProvider);
    final result = await wrapper.unFollow(channelId: channelId);

    return result.when(
      success: (_) {
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
