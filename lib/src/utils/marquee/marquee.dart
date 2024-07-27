import 'dart:async';

import 'package:flutter/material.dart';

enum MarqueeBehavior {
  scroll,
  alternate,
  slide,
}

class Marquee extends StatefulWidget {
  /// A horizontal scroll widgets when the parent of items has focus.
  ///
  /// Wrap this Marquee with [Focus(or FocusScope)].
  const Marquee({
    super.key,
    this.behavior = MarqueeBehavior.alternate,
    required this.hasFocus,
    required this.items,
    this.velocity = 25,
    this.startAfter = 700,
    this.scrollPadding = 30.0,
  });

  /// A behavior of scroll movement.
  ///
  /// [scroll]: Specify the text scrolls to the end and starts over.
  ///
  /// [alternate]: It defines that text moving to the end and then starting in the opposite direction.
  ///
  /// [slide]: It specifies the text moving to the end and then stops it.
  final MarqueeBehavior behavior;

  /// If hasFocus is true, marquee is activated.
  final bool hasFocus;

  /// Scroll duration is calculated appropriately according to the [maxScrollExtent] and [velocity].
  final int velocity;

  /// Waiting duration before start scrolling.
  final int startAfter;

  /// Add padding when using [MarqueeBehavior.scroll]
  final double scrollPadding;

  final List<Widget> items;

  @override
  State<Marquee> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> {
  final ScrollController _scrollController = ScrollController();
  Timer? _timer;

  bool _canScroll = false;

  // Set this true if widget's focus state updated.
  bool _isRunning = false;

  // Used in [MarqueeBahaviour.scroll]
  double _position = 0.0;

  int? itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = widget.items.length;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (_scrollController.hasClients) {
        final maxExtent = _scrollController.position.maxScrollExtent;
        if (maxExtent > 0.0 && maxExtent.isFinite) {
          _canScroll = true;
        } else {
          _canScroll = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Marquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasFocus != oldWidget.hasFocus && _canScroll) {
      if (widget.hasFocus) {
        _scroll();
      } else {
        _resetScrollPosition();
      }
    }
  }

  Future<void> _scroll() async {
    if (!_scrollController.hasClients) return;

    setState(() {
      _isRunning = true;
    });

    _wait(1, () async {
      switch (widget.behavior) {
        case MarqueeBehavior.scroll:
          await _animateScroll();
          break;
        case MarqueeBehavior.alternate:
          await _animateAlternate();
          break;
        case MarqueeBehavior.slide:
          await _animateSlide();
          break;
      }
    });
  }

  Future<void> _animateScroll() async {
    if (_scrollController.hasClients) {
      // Check the text or widget is overflow
      final maxExtent = _scrollController.position.maxScrollExtent;
      if (maxExtent > 0.1 && maxExtent.isFinite) {
        // if overflow, use infinite scrolling
        // else, don't scroll
        setState(() {
          // 'itemCount = null' means using infinite scrolling.
          itemCount = null;
        });
      }

      while (_canScroll && _isRunning && itemCount == null) {
        if (!_isRunning) break; // Exit if scrolling is no longer needed

        if (_scrollController.hasClients) {
          _position += widget.velocity;

          // velocity * 30 -> similar to alternate velocity.
          final duration = widget.velocity * 30;

          await _scrollController.animateTo(
            _position,
            duration: Duration(milliseconds: duration),
            curve: Curves.linear,
          );
        }

        // Check again if _isRunning changed during animation
        if (!_isRunning) break;
      }
    }
  }

  Future<void> _animateAlternate() async {
    // Sperate Future.delayed and scroll controlls to prevent bugs.
    while (_canScroll && _isRunning) {
      if (!_isRunning) break;

      // forward
      await _animateTo(true);

      await _animateTo(false);

      // backward

      if (!_isRunning) break;
    }
  }

  Future<void> _animateSlide() async {
    // just scroll once.
    await _animateTo(true);
    setState(() {
      _isRunning = false;
    });
  }

  Future<void> _animateTo(bool forward) async {
    if (_scrollController.hasClients && _canScroll && _isRunning) {
      // Check the text or widget is overflow
      final maxExtent = _scrollController.position.maxScrollExtent;
      final int duration =
          maxExtent < 0.01 ? 0 : ((maxExtent * 1000) / widget.velocity).floor();

      // if scroll is available (widgets is overflow)
      if (duration > 0) {
        await _scrollController.animateTo(
          forward ? maxExtent : 0.0,
          duration: Duration(milliseconds: duration),
          curve: Curves.linear,
        );
      }
    }
  }

  // wait before start scrolling with multiple times.
  // Use [Timer] to avoid infinite loop bugs when using [Future.delayed].
  void _wait(int multiple, VoidCallback callback) {
    _timer = Timer(
      Duration(milliseconds: widget.startAfter * multiple),
      () {
        callback();
      },
    );
  }

  void _resetScrollPosition() {
    setState(() {
      _timer?.cancel();
      itemCount = widget.items.length;
      _isRunning = false;
      _position = 0.0;
      _scrollController.jumpTo(0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: _scrollController,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          // if behavior is [MarqueeBehavior.scroll], use infinite scrolling
          final int itemIndex = widget.behavior == MarqueeBehavior.scroll
              ? index % widget.items.length
              : index;

          // Check again using 'itemCount == null' to use infinite scroll.
          // And add padding to the last widget.
          return itemCount == null && (itemIndex == widget.items.length - 1)
              ? Padding(
                  padding: EdgeInsets.only(right: widget.scrollPadding),
                  child: widget.items[itemIndex],
                )
              : widget.items[itemIndex];
        },
      ),
    );
  }
}
