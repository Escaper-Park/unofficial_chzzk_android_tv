import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';

class PopularClipInfo extends StatelessWidget {
  const PopularClipInfo({super.key, required this.clipTitle});

  final String clipTitle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            clipTitle,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
              overflow: TextOverflow.clip,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
