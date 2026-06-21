import 'package:flutter/material.dart';

import '../../../assets/assets.dart';
import '../../../design/design.dart';
import '../../components/cards/tv_card_design.dart';

abstract final class TvMediaCardDesign {
  static const width = TvCardWidth.three;
  static const imageContentGap = 0.0;
  static const contentHeight = 112.0;
  static const contentPadding = EdgeInsets.all(12);
  static const twoLineTitleHeight = 40.0;

  static const badgeInset = 8.0;
  static const badgeSpacing = 4.0;
  static const profileImageRadius = 16.0;
  static const profileInfoSpacing = 12.0;
  static const infoLineSpacing = 4.0;
  static const verifiedMarkSize = 12.0;
  static const metadataIconSize = 12.0;
  static const metadataIconSpacing = 4.0;
  static const metadataGroupSpacing = 6.0;
  static const metadataSeparatorSpacing = 4.0;
  static const thumbnailLoadingIconSize = 48.0;

  static const liveBadgeColor = AppColorTokens.liveIndicatorColor;
  static const vodBadgeColor = AppColorTokens.vodIndicatorColor;
  static const cardBackgroundColor = AppColorTokens.neutral10;
  static const scrimBadgeColor = Color(0xCC000000);
  static const tagBackgroundColor = Color(0x1AFFFFFF);
  static const tagOutlineColor = AppColorTokens.neutral30;
  static const thumbnailFallbackColor = AppColorTokens.neutral10;
  static const thumbnailFallbackIconColor = AppColorTokens.neutral100;
  static const progressTrackColor = Color(0x33FFFFFF);

  static const ageRestrictionAsset = AppAssetPaths.ageRestriction;
  static const ageRestrictionOverlayAsset = AppAssetPaths.ageRestrictionOverlay;
  static const abroadRestrictionAsset = AppAssetPaths.abroadRestriction;
  static const thumbnailLoadingAsset = AppAssetPaths.iconChzzkDark;
  static const verifiedMarkAsset = AppAssetPaths.verifiedMark;

  static double thumbnailHeight(TvCardWidth width) {
    return width.value * 9 / 16;
  }

  static double cardHeight(TvCardWidth width) {
    return thumbnailHeight(width) + imageContentGap + contentHeight;
  }
}
