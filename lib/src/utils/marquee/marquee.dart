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
      if (_scrollController.hasClients && widget.hasFocus) {
        _resetScrollPosition(); // reset
        _scroll();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _isRunning = false;
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Marquee oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.hasFocus != oldWidget.hasFocus) {
      if (widget.hasFocus) {
        _isRunning = true;
        _scroll();
      } else {
        _isRunning = false;
        _resetScrollPosition();
      }
    }
  }

  Future<bool> _scroll() async {
    await _wait(1);

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

    return widget.hasFocus;
  }

  Future<void> _animateScroll() async {
    if (_scrollController.hasClients) {
      // Check the text or widget is overflow
      final maxExtent = _scrollController.position.maxScrollExtent;
      if (maxExtent > 0.1) {
        // if overflow, use infinite scrolling
        // else, don't scroll
        setState(() {
          // 'itemCount = null' means using infinite scrolling.
          itemCount = null;
        });
      }

      while (_isRunning && itemCount == null) {
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
      }
    }
  }

  Future<void> _animateAlternate() async {
    // Sperate Future.delayed and scroll controlls to prevent bugs.
    while (_isRunning) {
      // forward
      await _animateTo(true);
      await _wait(2);
      // backward
      await _animateTo(false);
      await _wait(1);
    }
  }

  Future<void> _animateSlide() async {
    // just scroll once.
    await _animateTo(true);
  }

  Future<void> _animateTo(bool forward) async {
    if (_scrollController.hasClients && _isRunning) {
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
  Future<void> _wait(int multiple) async {
    await Future<void>.delayed(
        Duration(milliseconds: widget.startAfter * multiple));
  }

  void _resetScrollPosition() {
    setState(() {
      // [MarqueeBehavior.scroll]
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
