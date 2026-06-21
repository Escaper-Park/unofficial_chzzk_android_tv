import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import '../../../utils/utils.dart';
import 'tv_text_field_design.dart';

part 'tv_text_field_box.dart';
part 'tv_text_field_text.dart';
part 'tv_text_field_value.dart';

class TvTextField extends HookWidget {
  const TvTextField({
    super.key,
    required this.value,
    required this.onPressed,
    this.label,
    this.hintText,
    this.supportingText,
    this.showHint = true,
    this.active = false,
    this.autofocus = false,
    this.focusNode,
    this.design,
  });

  final String value;
  final VoidCallback onPressed;
  final String? label;
  final String? hintText;
  final String? supportingText;
  final bool showHint;
  final bool active;
  final bool autofocus;
  final FocusNode? focusNode;
  final TvTextFieldDesign? design;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final design = this.design ?? TvTextFieldDesign.standard();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final focused = focusNode.hasFocus;
    final cursorVisible = useState(true);

    void activate() {
      activationGuard.run(onPressed);
    }

    useEffect(
      () {
        if (!active) {
          cursorVisible.value = true;
          return null;
        }

        final timer = PeriodicCallbackTimer()
          ..start(
            interval: design.cursorBlinkInterval,
            onTick: () {
              cursorVisible.value = !cursorVisible.value;
            },
          );
        return timer.dispose;
      },
      [active, design.cursorBlinkInterval],
    );

    return AnimatedScale(
      scale: focused ? design.focusedScale : 1,
      duration: const Duration(milliseconds: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: design.gap,
        children: [
          if (label != null)
            _TvTextFieldText(
              text: label!,
              color: design.labelColor(
                colorScheme: colorScheme,
                active: active,
              ),
              style: textTheme.labelLarge,
            ),
          InkWell(
            autofocus: autofocus,
            focusNode: focusNode,
            onTap: activate,
            borderRadius: design.radius,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            child: _TvTextFieldBox(
              value: value,
              hintText: hintText,
              showHint: showHint,
              active: active,
              focused: focused,
              design: design,
              colorScheme: colorScheme,
              textStyle: textTheme.titleMedium,
              cursorVisible: cursorVisible.value,
            ),
          ),
          if (supportingText != null)
            _TvTextFieldText(
              text: supportingText!,
              color: design.supportingTextColor(colorScheme),
              style: textTheme.bodySmall,
            ),
        ],
      ),
    );
  }
}
