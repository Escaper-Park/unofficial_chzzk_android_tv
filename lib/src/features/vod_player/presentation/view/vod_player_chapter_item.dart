import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/tv/input/input.dart';
import '../../../../core/ui/ui.dart';
import '../../../vod/domain/entities/vod_detail.dart';
import '../vod_player_screen_ui_mapper.dart';
import 'vod_player_chapter_text_block.dart';
import 'vod_player_chapter_thumbnail.dart';
import 'vod_player_controls_overlay_design.dart';

class VodPlayerChapterItem extends HookWidget {
  const VodPlayerChapterItem({
    super.key,
    required this.chapter,
    required this.selected,
    required this.autofocus,
    required this.fallbackTitle,
    required this.onPressed,
  });

  final VodChapter chapter;
  final bool selected;
  final bool autofocus;
  final String fallbackTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final title = chapter.title.trim().isEmpty
        ? fallbackTitle
        : chapter.title.trim();
    final start = Duration(milliseconds: math.max(0, chapter.startTime));
    final design = TvListItemDesign.regular(lineCount: 2).copyWith(
      height: VodPlayerControlsOverlayDesign.chapterListItemHeight,
      padding: VodPlayerControlsOverlayDesign.chapterItemPadding,
      focusedScale: TvModalPanelDesign.itemFocusedScale,
    );
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final focused = focusNode.hasFocus;
    final palette = design.palette(
      colorScheme: colorScheme,
      focused: focused,
      selected: selected,
      enabled: true,
    );

    void activate() {
      activationGuard.run(onPressed);
    }

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.select): activate,
        const SingleActivator(LogicalKeyboardKey.enter): activate,
        const SingleActivator(LogicalKeyboardKey.numpadEnter): activate,
      },
      child: AnimatedScale(
        scale: focused ? design.focusedScale : 1,
        duration: const Duration(milliseconds: 120),
        child: Focus(
          focusNode: focusNode,
          canRequestFocus: true,
          autofocus: autofocus,
          child: Semantics(
            button: true,
            selected: selected,
            onTap: activate,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: activate,
              child: SizedBox(
                height: design.height,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: design.backgroundColor(
                      colorScheme: colorScheme,
                      focused: focused,
                      selected: selected,
                      enabled: true,
                    ),
                    borderRadius: design.radius,
                  ),
                  child: Padding(
                    padding: design.padding,
                    child: Row(
                      children: [
                        VodPlayerChapterThumbnail(
                          imageUrl: chapter.thumbnailUrl,
                        ),
                        const SizedBox(
                          width: VodPlayerControlsOverlayDesign
                              .chapterThumbnailTextGap,
                        ),
                        SizedBox(
                          width:
                              VodPlayerControlsOverlayDesign.chapterTextWidth,
                          child: VodPlayerChapterTextBlock(
                            title: title,
                            timeText: VodPlayerScreenUiMapper.timeText(start),
                            titleStyle: textTheme.titleSmall?.copyWith(
                              color: palette.title,
                            ),
                            timeStyle: textTheme.bodySmall?.copyWith(
                              color: palette.subtitle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
