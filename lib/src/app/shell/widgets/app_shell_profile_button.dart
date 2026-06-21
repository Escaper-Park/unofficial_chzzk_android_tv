import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../core/ui/ui.dart';
import '../app_shell_design.dart';

class AppShellProfileButton extends HookWidget {
  const AppShellProfileButton({
    super.key,
    required this.imageUrl,
    required this.onPressed,
  });

  final String? imageUrl;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final colorScheme = Theme.of(context).colorScheme;
    final focused = focusNode.hasFocus;

    return SizedBox.fromSize(
      size: AppShellDesign.profileAvatarButtonSize,
      child: AnimatedScale(
        scale: focused ? AppShellDesign.profileAvatarFocusedScale : 1,
        duration: const Duration(milliseconds: 120),
        child: TextButton(
          focusNode: focusNode,
          onPressed: onPressed,
          style: const ButtonStyle(
            fixedSize: WidgetStatePropertyAll(
              AppShellDesign.profileAvatarButtonSize,
            ),
            minimumSize: WidgetStatePropertyAll(Size.zero),
            padding: WidgetStatePropertyAll(EdgeInsets.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            shape: WidgetStatePropertyAll(StadiumBorder()),
          ),
          child: Center(
            child: SizedBox.square(
              dimension: AppShellDesign.profileAvatarFocusRingSize,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: focused
                      ? Border.all(
                          color: colorScheme.primary,
                          width: AppShellDesign.profileAvatarFocusStroke,
                        )
                      : null,
                ),
                child: Center(
                  child: ProfileCircleAvatar(
                    imageUrl: imageUrl,
                    radius: AppShellDesign.profileAvatarRadius,
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
