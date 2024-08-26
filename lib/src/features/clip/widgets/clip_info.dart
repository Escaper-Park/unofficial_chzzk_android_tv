import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../model/clip.dart';

class ClipInfo extends StatelessWidget {
  const ClipInfo({super.key, required this.clip});

  final NaverClip clip;

  @override
  Widget build(BuildContext context) {
    // yyyy-MM-dd
    final String createdDate = clip.createdDate.split(' ')[0];

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Clip Title
          Expanded(
            child: Text(
              clip.clipTitle,
              style: const TextStyle(
                fontSize: 13.0,
                color: AppColors.whiteColor,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          // Clip duration and created date
          Text(
            '${clip.duration} s \u00b7 $createdDate',
            style: const TextStyle(
              fontSize: 11.0,
              color: AppColors.greyColor,
            ),
          )
        ],
      ),
    );
  }
}
