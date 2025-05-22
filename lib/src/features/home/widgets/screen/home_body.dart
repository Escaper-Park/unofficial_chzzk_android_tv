part of '../../home_screen.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({
    required this.auth,
    required this.scrollController,
    required this.topMenu,
    required this.followingLives,
    required this.popularLives,
    required this.followingCategories,
  });

  final Auth? auth;
  final ScrollController scrollController;
  final Widget topMenu;
  final Widget followingLives;
  final Widget popularLives;
  final Widget followingCategories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topMenu,
            if (auth != null) followingLives,
            popularLives,
            if (auth != null) followingCategories,
          ],
        ),
      ),
    );
  }
}
