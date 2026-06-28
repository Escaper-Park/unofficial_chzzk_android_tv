import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/assets/app_asset_paths.dart';
import '../../../player_shared/presentation/player_content/player_content.dart';
import '../live_player_screen_design.dart';
import '../live_player_screen_string.dart';

class LivePlayerStatusSurface extends StatelessWidget {
  const LivePlayerStatusSurface({
    super.key,
    required this.message,
    this.showRetryHint = false,
  }) : loading = false;

  const LivePlayerStatusSurface.loading({
    super.key,
  }) : message = null,
       showRetryHint = false,
       loading = true;

  const LivePlayerStatusSurface.inactiveFailure({
    super.key,
  }) : message = null,
       showRetryHint = false,
       loading = false;

  final String? message;
  final bool showRetryHint;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const ColoredBox(
        color: LivePlayerScreenDesign.backgroundColor,
        child: Center(
          child: LivePlayerLoadingIndicator(),
        ),
      );
    }

    if (message == null) {
      return const _LivePlayerInactiveFailureSurface();
    }

    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: LivePlayerScreenDesign.statusMaxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message!,
                textAlign: TextAlign.center,
                style: LivePlayerScreenDesign.statusTextStyle(context),
              ),
              if (showRetryHint) ...[
                const SizedBox(height: LivePlayerScreenDesign.statusActionGap),
                Text(
                  LivePlayerScreenString.retrySelectHint,
                  textAlign: TextAlign.center,
                  style: LivePlayerScreenDesign.statusActionTextStyle(context),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _LivePlayerInactiveFailureSurface extends StatelessWidget {
  const _LivePlayerInactiveFailureSurface();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: LivePlayerScreenDesign.backgroundColor,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final shortestSide = math.min(
              constraints.maxWidth,
              constraints.maxHeight,
            );
            final iconSize =
                (shortestSide *
                        LivePlayerScreenDesign.inactiveStatusIconSizeRatio)
                    .clamp(
                      LivePlayerScreenDesign.inactiveStatusIconMinSize,
                      LivePlayerScreenDesign.inactiveStatusIconMaxSize,
                    );

            return Image.asset(
              AppAssetPaths.iconChzzkDark,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}

class LivePlayerLoadingIndicator extends StatelessWidget {
  const LivePlayerLoadingIndicator({
    super.key,
    this.size = TvPlayerLoadingIndicatorDesign.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return TvPlayerLoadingIndicator(size: size);
  }
}
