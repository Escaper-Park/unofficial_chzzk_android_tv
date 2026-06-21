import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../vod/domain/entities/vod_detail.dart';
import '../vod_player_screen_string.dart';
import 'vod_player_chapter_item.dart';
import 'vod_player_controls_overlay_design.dart';

class VodPlayerChapterPanel extends HookWidget {
  const VodPlayerChapterPanel({
    super.key,
    required this.chapters,
    required this.currentPosition,
    required this.onChapterSelected,
    required this.onDismiss,
  });

  final List<VodChapter> chapters;
  final Duration currentPosition;
  final ValueChanged<VodChapter> onChapterSelected;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final selectedIndex = _selectedChapterIndex(
      chapters: chapters,
      position: currentPosition,
    );
    final scrollController = useScrollController(
      initialScrollOffset:
          selectedIndex * VodPlayerControlsOverlayDesign.chapterListItemHeight,
    );

    return TvModalPanel(
      type: TvModalPanelType.large,
      position: TvModalPanelPosition.left,
      showScrim: true,
      header: VodPlayerScreenString.chapters,
      onDismiss: onDismiss,
      child: Expanded(
        child: chapters.isEmpty
            ? const Center(child: Text(VodPlayerScreenString.noChapters))
            : ListView.separated(
                controller: scrollController,
                padding: EdgeInsets.zero,
                itemCount: chapters.length,
                itemBuilder: (context, index) {
                  final chapter = chapters[index];
                  return VodPlayerChapterItem(
                    chapter: chapter,
                    selected: index == selectedIndex,
                    autofocus: index == selectedIndex,
                    fallbackTitle:
                        '${VodPlayerScreenString.chapters} ${index + 1}',
                    onPressed: () => onChapterSelected(chapter),
                  );
                },
                separatorBuilder: (_, _) => const SizedBox(
                  height: VodPlayerControlsOverlayDesign.chapterListGap,
                ),
              ),
      ),
    );
  }
}

int _selectedChapterIndex({
  required List<VodChapter> chapters,
  required Duration position,
}) {
  if (chapters.isEmpty) {
    return 0;
  }

  final positionMs = position.inMilliseconds;
  for (var index = 0; index < chapters.length; index += 1) {
    final chapter = chapters[index];
    if (chapter.startTime <= positionMs && positionMs < chapter.endTime) {
      return index;
    }
  }

  var selectedIndex = 0;
  for (var index = 0; index < chapters.length; index += 1) {
    if (chapters[index].startTime <= positionMs) {
      selectedIndex = index;
    }
  }

  return selectedIndex;
}
