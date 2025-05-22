part of '../category_container.dart';

class _CategoryContainerBody extends StatelessWidget {
  const _CategoryContainerBody({
    required this.categoryPoster,
    required this.categoryInfoCard,
  });

  final Widget categoryPoster;
  final Widget categoryInfoCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        categoryPoster,
        Expanded(child: categoryInfoCard),
      ],
    );
  }
}
