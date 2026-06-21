part of 'tv_vod_overlay_playback_info.dart';

class _TvVodSeekBar extends HookWidget {
  const _TvVodSeekBar({
    required this.value,
    required this.showHandle,
    required this.position,
    required this.duration,
    required this.seekStep,
    required this.chapters,
    required this.seekThumbnail,
    required this.previewTimeTextBuilder,
    required this.onSeek,
    required this.onSeekFeedback,
    required this.onFocusChanged,
  });

  final double value;
  final bool showHandle;
  final Duration position;
  final Duration duration;
  final Duration seekStep;
  final List<TvVodOverlaySeekChapter> chapters;
  final TvVodOverlaySeekThumbnail? seekThumbnail;
  final String Function(Duration duration) previewTimeTextBuilder;
  final ValueChanged<Duration>? onSeek;
  final TvVodOverlaySeekFeedbackCallback? onSeekFeedback;
  final ValueChanged<bool>? onFocusChanged;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode(debugLabel: 'vod overlay seek bar');
    final previewPosition = useState<Duration?>(null);
    final previewHideController = useMemoized(
      () => _TvVodSeekPreviewHideController(
        duration: TvPlayerOverlayControlsDesign.vodSeekPreviewRetainDuration,
      ),
      const [],
    );
    final activeSeekKey = useRef<LogicalKeyboardKey?>(null);
    final seekRepeatCount = useRef(0);
    useListenable(focusNode);

    void cancelPreviewHideTimer() {
      previewHideController.cancel();
    }

    void resetSeekAcceleration() {
      activeSeekKey.value = null;
      seekRepeatCount.value = 0;
    }

    void hidePreview() {
      cancelPreviewHideTimer();
      previewPosition.value = null;
    }

    void schedulePreviewHide() {
      previewHideController.schedule(
        shouldHide: () => focusNode.hasFocus && previewPosition.value != null,
        hide: () => previewPosition.value = null,
      );
    }

    useEffect(() {
      return previewHideController.dispose;
    }, [previewHideController]);

    final colorScheme = Theme.of(context).colorScheme;
    final focused = focusNode.hasFocus;
    final enabled = onSeek != null && duration > Duration.zero;
    final currentPreviewPosition = previewPosition.value;
    final displayPosition = _clampDuration(
      currentPreviewPosition ?? position,
      duration,
    );
    final displayValue = _progressValue(
      fallback: value,
      position: displayPosition,
      duration: duration,
    );
    final sortedChapters = useMemoized(
      () => _sortedSeekChapters(chapters),
      [chapters],
    );
    final seekSegments = useMemoized(
      () => _seekSegments(chapters: sortedChapters, duration: duration),
      [sortedChapters, duration],
    );
    final hasValidSeekThumbnail = useMemoized(
      () => _hasValidSeekThumbnail(seekThumbnail),
      [seekThumbnail],
    );
    final previewChapter = currentPreviewPosition == null
        ? null
        : _chapterAtPosition(
            chapters: sortedChapters,
            position: currentPreviewPosition,
          );
    final showPreview =
        focused &&
        currentPreviewPosition != null &&
        (previewChapter != null || hasValidSeekThumbnail);

    return Focus(
      focusNode: focusNode,
      canRequestFocus: enabled,
      onFocusChange: (focused) {
        if (!focused) {
          hidePreview();
          resetSeekAcceleration();
        }
        onFocusChanged?.call(focused);
      },
      onKeyEvent: (node, event) => _handleVodSeekBarKeyEvent(
        event: event,
        onSeek: onSeek,
        onSeekFeedback: onSeekFeedback,
        duration: duration,
        position: position,
        seekStep: seekStep,
        previewPosition: previewPosition,
        activeSeekKey: activeSeekKey,
        seekRepeatCount: seekRepeatCount,
        cancelPreviewHideTimer: cancelPreviewHideTimer,
        schedulePreviewHide: schedulePreviewHide,
        resetSeekAcceleration: resetSeekAcceleration,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final previewLeft = _previewLeft(
            availableWidth: constraints.maxWidth,
            value: displayValue,
          );

          return SizedBox(
            key: const ValueKey('vod-overlay-seek-bar'),
            height: TvPlayerOverlayControlsDesign.bottomRowHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned.fill(
                  child: AnimatedContainer(
                    duration: TvPlayerOverlayControlsDesign.labelFadeDuration,
                    padding: TvPlayerOverlayControlsDesign.vodSeekFocusPadding,
                    decoration: BoxDecoration(
                      color: focused
                          ? colorScheme.onSurface.withValues(alpha: 0.08)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(
                        TvPlayerOverlayControlsDesign.vodSeekFocusRadius,
                      ),
                      border: Border.all(
                        color: focused
                            ? colorScheme.primary
                            : Colors.transparent,
                        width: TvPlayerOverlayControlsDesign
                            .vodSeekFocusBorderWidth,
                      ),
                    ),
                    child: _TvVodSegmentedProgressBar(
                      value: displayValue,
                      showHandle: showHandle,
                      segments: seekSegments,
                      progressColor: focused ? colorScheme.primary : null,
                      trackColor: focused
                          ? colorScheme.onSurface.withValues(alpha: 0.32)
                          : null,
                    ),
                  ),
                ),
                if (showPreview)
                  Positioned(
                    left: previewLeft,
                    bottom:
                        TvPlayerOverlayControlsDesign.bottomRowHeight +
                        TvPlayerOverlayControlsDesign.vodSeekPreviewSeekBarGap,
                    child: _TvVodSeekPreview(
                      chapter: previewChapter,
                      position: displayPosition,
                      duration: duration,
                      seekThumbnail: seekThumbnail,
                      timeTextBuilder: previewTimeTextBuilder,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
