import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/exceptions/exceptions.dart';
import '../../live_stream/controller/live_mode_controller.dart';
import '../../live_stream/controller/live_playlist_controller.dart';
import '../model/live_detail.dart';
import '../model/live_status.dart';
import '../repository/live_repository_wrapper.dart';

part 'live_controller.g.dart';

@riverpod
class LiveController extends _$LiveController {
  @override
  void build() {
    return;
  }

  /// Adds a live stream to the playlist for playback.
  ///
  /// Resets the current playlist and mode before adding the new stream.
  Future<void> addLiveToPlaylist({required LiveDetail liveDetail}) async {
    ref.read(livePlaylistControllerProvider.notifier).reset();
    ref.read(liveModeControllerProvider.notifier).reset();

    // add playlist
    ref
        .read(livePlaylistControllerProvider.notifier)
        .addLive(liveDetail: liveDetail);
  }

  /// Get live detail to play a live stream using Result pattern.
  ///
  /// Returns:
  /// - [LiveDetail] if the live stream is found and accessible
  /// - null if:
  ///   - Stream not found or has ended
  ///   - Age/region restricted (for anonymous users)
  ///   - Network error occurs
  ///
  /// Errors are logged in debug mode for troubleshooting.
  Future<LiveDetail?> getLiveDetail({required String channelId}) async {
    final wrapper = ref.read(liveRepositoryWrapperProvider);
    final result = await wrapper.getLiveDetail(channelId: channelId);

    return result.when(
      success: (liveDetail) {
        // Check for adult content restriction
        if (liveDetail != null && liveDetail.adult) {
          // Log for debugging - caller should check adult flag
          assert(() {
            // ignore: avoid_print
            print(
              'LiveController.getLiveDetail: Adult content for $channelId',
            );
            return true;
          }());
        }

        // Check for region restriction
        if (liveDetail != null && liveDetail.krOnlyViewing) {
          // Log for debugging - caller should check krOnlyViewing flag
          assert(() {
            // ignore: avoid_print
            print(
              'LiveController.getLiveDetail: '
              'Region restricted content for $channelId',
            );
            return true;
          }());
        }

        return liveDetail;
      },
      failure: (exception) {
        // Log errors for debugging
        assert(() {
          // ignore: avoid_print
          print('LiveController.getLiveDetail error: ${exception.message}');
          return true;
        }());

        // Handle streaming-specific errors
        if (exception is StreamingException) {
          // Specific handling could be added here if needed
          // e.g., show different UI for age-restricted vs ended streams
        }

        // Return null to maintain backward compatibility
        return null;
      },
    );
  }

  /// Get [LiveStatus] while watching a live stream using Result pattern.
  ///
  /// Returns:
  /// - [LiveStatus] if the stream is still live
  /// - null if:
  ///   - Stream has ended
  ///   - Network error occurs
  ///
  /// This method is typically called periodically to check if
  /// the stream is still active and to update viewer counts.
  Future<LiveStatus?> getLiveStatus({required String channelId}) async {
    final wrapper = ref.read(liveRepositoryWrapperProvider);
    final result = await wrapper.getLiveStatus(
      channelId: channelId,
      includePlayerRecommendContent: false,
    );

    return result.when(
      success: (liveStatus) => liveStatus,
      failure: (exception) {
        // Log errors for debugging
        assert(() {
          // ignore: avoid_print
          print('LiveController.getLiveStatus error: ${exception.message}');
          return true;
        }());

        // Handle stream ended scenario
        if (exception is StreamingException &&
            exception.type == StreamingExceptionType.liveEnded) {
          // Stream has ended - caller should update UI accordingly
        }

        // Return null to maintain backward compatibility
        return null;
      },
    );
  }
}
