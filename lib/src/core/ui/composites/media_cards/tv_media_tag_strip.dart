import 'package:flutter/material.dart';

import '../../components/primitives/primitives.dart';

class TvMediaTagStrip extends StatelessWidget {
  const TvMediaTagStrip({
    super.key,
    required this.tags,
  });

  final List<Widget> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TvTagDesign.resolve(TvTagSize.small).height,
      child: ClipRect(
        child: OverflowBox(
          maxWidth: double.infinity,
          alignment: Alignment.centerLeft,
          child: TvTagsRow(tags: tags),
        ),
      ),
    );
  }
}
