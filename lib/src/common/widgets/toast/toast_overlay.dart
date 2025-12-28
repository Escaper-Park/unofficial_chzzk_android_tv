import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/styles.dart';
import 'toast_service.dart';

/// A widget that displays toast notifications as an overlay.
///
/// This widget should be placed high in the widget tree, typically
/// wrapping the main content of the app.
///
/// Usage:
/// ```dart
/// ToastOverlay(
///   child: MaterialApp(...),
/// )
/// ```
class ToastOverlay extends ConsumerWidget {
  const ToastOverlay({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final toast = ref.watch(toastServiceProvider);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          child,
          if (toast != null)
            Positioned(
              bottom: 80,
              left: 0,
              right: 0,
              child: Center(
                child: ToastWidget(toast: toast),
              ),
            ),
        ],
      ),
    );
  }
}

/// The actual toast widget that displays the message.
class ToastWidget extends StatefulWidget {
  const ToastWidget({
    super.key,
    required this.toast,
  });

  final ToastMessage toast;

  @override
  State<ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutCubic,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 400,
            minWidth: 200,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: _getBackgroundColor(widget.toast.type),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getIcon(widget.toast.type),
                color: AppColors.whiteColor,
                size: 20,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.toast.message,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(ToastType type) {
    return switch (type) {
      ToastType.success => AppColors.chzzkColor.withValues(alpha: 0.9),
      ToastType.error => AppColors.redColor.withValues(alpha: 0.9),
      ToastType.info => AppColors.greyContainerColor.withValues(alpha: 0.95),
    };
  }

  IconData _getIcon(ToastType type) {
    return switch (type) {
      ToastType.success => Icons.check_circle_outline,
      ToastType.error => Icons.error_outline,
      ToastType.info => Icons.info_outline,
    };
  }
}
