import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/player_content/player_content.dart';
import '../vod_player_screen_design.dart';
import '../vod_player_screen_string.dart';

class VodPlayerStatusSurface extends StatelessWidget {
  const VodPlayerStatusSurface({
    super.key,
    required this.message,
    this.onRetry,
  }) : loading = false;

  const VodPlayerStatusSurface.loading({
    super.key,
  }) : message = null,
       onRetry = null,
       loading = true;

  final String? message;
  final VoidCallback? onRetry;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const ColoredBox(
        color: VodPlayerScreenDesign.backgroundColor,
        child: Center(
          child: VodPlayerLoadingIndicator(),
        ),
      );
    }

    return ColoredBox(
      color: VodPlayerScreenDesign.backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: VodPlayerScreenDesign.statusMaxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: VodPlayerScreenDesign.statusContentGap,
            children: [
              Text(
                message!,
                textAlign: TextAlign.center,
                style: VodPlayerScreenDesign.statusTextStyle(context),
              ),
              if (onRetry != null)
                TvButton.label(
                  text: VodPlayerScreenString.retry,
                  onPressed: onRetry!,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class VodPlayerLoadingIndicator extends StatelessWidget {
  const VodPlayerLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const TvPlayerLoadingIndicator();
  }
}
