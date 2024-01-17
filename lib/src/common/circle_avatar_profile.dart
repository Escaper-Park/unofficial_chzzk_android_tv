import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../constants/styles.dart';

class CircleAvatarProfile extends StatelessWidget {
  const CircleAvatarProfile({
    super.key,
    this.hasBorder = false,
    this.radius = 15.0,
    this.profileImgUrl,
  });

  final double radius;
  final bool hasBorder;
  final String? profileImgUrl;

  @override
  Widget build(BuildContext context) {
    return (profileImgUrl == null || profileImgUrl!.isEmpty)
        ? CircleAvatar(
            radius: radius,
            backgroundColor: Colors.black54,
          )
        : CachedNetworkImage(
            imageUrl: profileImgUrl!,
            imageBuilder: (context, imageProvider) {
              return Container(
                width: radius * 2,
                height: radius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:
                        hasBorder ? AppColors.chzzkColor : Colors.transparent,
                    width: 2.0,
                  ),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
            placeholder: (context, url) => SizedBox(
              width: radius * 2,
              height: radius * 2,
            ),
          );
  }
}
