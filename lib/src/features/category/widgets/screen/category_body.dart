part of '../../category_screen.dart';

class _CategoryBody extends StatelessWidget {
  const _CategoryBody({
    required this.categoryHeader,
    required this.categoryGridView,
    required this.horizontalPadding,
  });

  final Widget categoryHeader;
  final Widget categoryGridView;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          categoryHeader,
          Expanded(
            child: categoryGridView,
          ),
        ],
      ),
    );
  }
}
