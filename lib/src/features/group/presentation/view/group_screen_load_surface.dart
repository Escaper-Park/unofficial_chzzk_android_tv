part of 'group_screen.dart';

class _GroupLoadSurface extends StatelessWidget {
  const _GroupLoadSurface({
    required this.state,
    required this.child,
  });

  final GroupState state;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (state.loadStatus) {
      GroupLoadStatus.initial ||
      GroupLoadStatus.loading => const ContentStateView.loading(),
      GroupLoadStatus.failure => ContentStateView.error(
        message: GroupScreenString.loadFailed,
        action: TvButton.label(
          text: GroupScreenString.retry,
          onPressed: () {
            context.read<GroupBloc>().add(const GroupEvent.retryRequested());
          },
        ),
      ),
      GroupLoadStatus.ready => child,
    };
  }
}
