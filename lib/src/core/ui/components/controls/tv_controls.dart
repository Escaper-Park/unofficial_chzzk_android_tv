import 'package:flutter/material.dart';

import 'tv_controls_design.dart';

export 'tv_slider.dart';

class TvCheckbox extends StatelessWidget {
  const TvCheckbox({
    super.key,
    required this.selected,
    this.focused = false,
    this.size = TvControlSize.standard,
    this.shape = TvCheckboxShape.rectangle,
  });

  final bool selected;
  final bool focused;
  final TvControlSize size;
  final TvCheckboxShape shape;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = TvControlDesign.selectionColor(
      colorScheme: colorScheme,
      focused: focused,
      selected: selected,
    );
    final dimension = TvControlDesign.containerSize(size);
    final radius = switch (shape) {
      TvCheckboxShape.rectangle => 0.0,
      TvCheckboxShape.rounded => 20.0,
    };

    return SizedBox.square(
      dimension: dimension,
      child: Center(
        child: Checkbox(
          value: selected,
          onChanged: null,
          fillColor: WidgetStatePropertyAll(
            selected ? color : Colors.transparent,
          ),
          checkColor: focused
              ? colorScheme.onPrimaryContainer
              : colorScheme.onSecondary,
          overlayColor: _transparentOverlay,
          splashRadius: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          side: BorderSide(color: color, width: 2),
        ),
      ),
    );
  }
}

class TvRadioButton extends StatelessWidget {
  const TvRadioButton({
    super.key,
    required this.selected,
    this.focused = false,
    this.size = TvControlSize.standard,
  });

  final bool selected;
  final bool focused;
  final TvControlSize size;

  @override
  Widget build(BuildContext context) {
    final color = TvControlDesign.selectionColor(
      colorScheme: Theme.of(context).colorScheme,
      focused: focused,
      selected: selected,
    );
    final dimension = TvControlDesign.containerSize(size);

    return SizedBox.square(
      dimension: dimension,
      child: RadioGroup<int>(
        groupValue: selected ? 1 : 0,
        onChanged: (_) {},
        child: Radio<int>(
          value: 1,
          enabled: false,
          fillColor: WidgetStatePropertyAll(color),
          overlayColor: _transparentOverlay,
          splashRadius: 0,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.standard,
          side: BorderSide(color: color, width: 2),
          innerRadius: WidgetStatePropertyAll(dimension * 0.22),
        ),
      ),
    );
  }
}

class TvSwitch extends StatelessWidget {
  const TvSwitch({
    super.key,
    required this.selected,
    this.focused = false,
    this.size = TvControlSize.standard,
  });

  final bool selected;
  final bool focused;
  final TvControlSize size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final palette = TvControlDesign.switchPalette(
      colorScheme: colorScheme,
      focused: focused,
      selected: selected,
    );
    final switchSize = TvControlDesign.switchSize(size);

    return SizedBox.fromSize(
      size: switchSize,
      child: Center(
        child: Transform.scale(
          scale: TvControlDesign.switchScale(size),
          child: Switch(
            value: selected,
            onChanged: null,
            thumbColor: WidgetStatePropertyAll(palette.handle),
            trackColor: WidgetStatePropertyAll(palette.track),
            trackOutlineColor: WidgetStatePropertyAll(palette.stroke),
            trackOutlineWidth: const WidgetStatePropertyAll(1),
            overlayColor: _transparentOverlay,
            splashRadius: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: EdgeInsets.zero,
          ),
        ),
      ),
    );
  }
}

class TvCheckmark extends StatelessWidget {
  const TvCheckmark({
    super.key,
    this.focused = false,
    this.size = TvControlSize.standard,
  });

  final bool focused;
  final TvControlSize size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check,
      size: TvControlDesign.containerSize(size),
      color: TvControlDesign.checkmarkColor(
        colorScheme: Theme.of(context).colorScheme,
        focused: focused,
      ),
    );
  }
}

const _transparentOverlay = WidgetStatePropertyAll<Color>(Colors.transparent);
