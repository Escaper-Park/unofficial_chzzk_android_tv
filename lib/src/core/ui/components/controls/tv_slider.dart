import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TvSlider extends StatefulWidget {
  const TvSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeEnd,
    this.min = 0,
    this.max = 1,
    this.divisions,
    this.step,
    this.wraps = false,
    this.focusNode,
    this.autofocus = false,
    this.onSubmitted,
  });

  final double value;
  final ValueChanged<double> onChanged;
  final ValueChanged<double>? onChangeEnd;
  final double min;
  final double max;
  final int? divisions;
  final double? step;
  final bool wraps;
  final FocusNode? focusNode;
  final bool autofocus;
  final VoidCallback? onSubmitted;

  @override
  State<TvSlider> createState() => _TvSliderState();
}

class _TvSliderState extends State<TvSlider> {
  double? _lastChangedValue;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      onKeyEvent: _onKeyEvent,
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
          overlayShape: SliderComponentShape.noOverlay,
        ),
        child: Slider(
          value: widget.value.clamp(widget.min, widget.max).toDouble(),
          min: widget.min,
          max: widget.max,
          divisions: widget.divisions,
          onChanged: _handleChanged,
          onChangeEnd: _handleChangeEnd,
        ),
      ),
    );
  }

  double get _step {
    final explicitStep = widget.step;
    if (explicitStep != null) {
      return explicitStep;
    }

    final divisionCount = widget.divisions;
    if (divisionCount != null && divisionCount > 0) {
      return (widget.max - widget.min) / divisionCount;
    }

    return (widget.max - widget.min) / 20;
  }

  void _changeBy(double delta) {
    _handleChanged(_nextValue(delta));
  }

  double _nextValue(double delta) {
    final next = _currentValue + delta;
    if (!widget.wraps) {
      return next.clamp(widget.min, widget.max).toDouble();
    }

    if (next > widget.max) {
      return widget.min;
    }

    if (next < widget.min) {
      return widget.max;
    }

    return next;
  }

  double get _currentValue {
    return _lastChangedValue ?? widget.value;
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    final key = event.logicalKey;
    final isLeft = key == LogicalKeyboardKey.arrowLeft;
    final isRight = key == LogicalKeyboardKey.arrowRight;
    final isSubmit =
        key == LogicalKeyboardKey.select ||
        key == LogicalKeyboardKey.enter ||
        key == LogicalKeyboardKey.numpadEnter;
    if (isSubmit && widget.onSubmitted != null) {
      if (event is KeyDownEvent) {
        widget.onSubmitted?.call();
      }

      return KeyEventResult.handled;
    }

    if (!isLeft && !isRight) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent || event is KeyRepeatEvent) {
      _changeBy(isLeft ? -_step : _step);
      return KeyEventResult.handled;
    }

    if (event is KeyUpEvent) {
      _handleChangeEnd(_currentValue);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }

  void _handleChanged(double value) {
    _lastChangedValue = value;
    widget.onChanged(value);
  }

  void _handleChangeEnd(double value) {
    _lastChangedValue = null;
    widget.onChangeEnd?.call(value);
  }
}
