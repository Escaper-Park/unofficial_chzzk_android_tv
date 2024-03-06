import 'package:flutter/material.dart';

import '../../../common/constants/dimensions.dart';

class HomeBaseContainer extends StatelessWidget {
  const HomeBaseContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.homeBaseContainerHeight,
      child: child,
    );
  }
}
