part of 'home_immersive_list.dart';

class HomeImmersiveListBackground extends StatelessWidget {
  const HomeImmersiveListBackground({
    super.key,
    required this.thumbnail,
    this.showScrim = true,
  });

  final Widget thumbnail;
  final bool showScrim;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        thumbnail,
        if (showScrim) const TvScrim(type: TvScrimType.homeImmersive),
      ],
    );
  }
}
