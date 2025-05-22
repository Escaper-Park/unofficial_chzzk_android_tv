part of '../../dashboard_screen.dart';

class _DashboardBody extends StatelessWidget {
  const _DashboardBody({
    required this.sidebar,
    required this.contents,
  });

  final Widget sidebar;
  final Widget contents;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        contents,
        sidebar,
      ],
    );
  }
}
