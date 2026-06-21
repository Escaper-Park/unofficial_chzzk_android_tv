part of 'tv_dialog.dart';

class _TvDialogRouteBackDismiss extends StatefulWidget {
  const _TvDialogRouteBackDismiss({
    required this.dialogContext,
    required this.child,
  });

  final BuildContext dialogContext;
  final Widget child;

  @override
  State<_TvDialogRouteBackDismiss> createState() =>
      _TvDialogRouteBackDismissState();
}

class _TvDialogRouteBackDismissState extends State<_TvDialogRouteBackDismiss> {
  final _activationGuard = TvActivationGuard();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) {
          return;
        }

        _activationGuard.run(() {
          Navigator.of(widget.dialogContext, rootNavigator: true).pop();
        });
      },
      child: widget.child,
    );
  }
}
