import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import 'tv_card_design.dart';

part 'tv_card_body.dart';
part 'tv_card_content.dart';
part 'tv_card_frame.dart';

class TvCard extends HookWidget {
  const TvCard({
    super.key,
    required this.image,
    required this.onPressed,
    this.type = TvCardType.standard,
    this.width = TvCardWidth.three,
    this.thumbnailRatio = TvCardThumbnailRatio.ratio16x9,
    this.title,
    this.subtitle,
    this.description,
    this.extras,
    this.content,
    this.autofocus = false,
    this.focusNode,
    this.design,
  });

  final Widget image;
  final VoidCallback onPressed;
  final TvCardType type;
  final TvCardWidth width;
  final TvCardThumbnailRatio thumbnailRatio;
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? extras;
  final Widget? content;
  final bool autofocus;
  final FocusNode? focusNode;
  final TvCardDesign? design;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final design = this.design ?? TvCardDesign.defaults();
    final focused = focusNode.hasFocus;

    return AnimatedScale(
      scale: focused ? design.focusedScale : 1,
      duration: const Duration(milliseconds: 120),
      child: _TvCardFrame(
        focused: focused,
        design: design,
        child: InkWell(
          autofocus: autofocus,
          focusNode: focusNode,
          onTap: () => activationGuard.run(onPressed),
          customBorder: RoundedRectangleBorder(borderRadius: design.radius),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          child: SizedBox(
            width: width.value,
            child: _TvCardBody(
              type: type,
              image: image,
              width: width,
              thumbnailRatio: thumbnailRatio,
              title: title,
              subtitle: subtitle,
              description: description,
              extras: extras,
              content: content,
              design: design,
            ),
          ),
        ),
      ),
    );
  }
}
