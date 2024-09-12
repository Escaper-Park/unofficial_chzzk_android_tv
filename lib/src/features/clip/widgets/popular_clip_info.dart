import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../model/clip.dart';

class PopularClipInfo extends StatelessWidget {
  const PopularClipInfo({super.key, required this.clip});

  final NaverClip clip;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: 70.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  clip.clipTitle,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: AppColors.whiteColor,
                    overflow: TextOverflow.clip,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Text(
                clip.ownerChannel.channelName,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 12.0,
                  color: AppColors.whiteColor,
                ),
              ),
              Text(
                '조회수 ${clip.readCount} 회',
                style: const TextStyle(
                  fontSize: 11.0,
                  color: AppColors.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
