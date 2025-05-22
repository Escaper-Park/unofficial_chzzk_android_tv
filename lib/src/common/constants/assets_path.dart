abstract class AssetsPath {
  const AssetsPath._();

  static const String _imgPath = 'assets/images';

  static const String locoIcon = '$_imgPath/logo_icon.png';

  /// If the user is not logged in or has not authenticated as an adult,
  /// use this image to prevent the user from viewing adult streams.
  static const String ageRestriction = '$_imgPath/age_restriction.png';

  /// BlindType is "ABROAD", display this image.
  static const String abroadRestriction = '$_imgPath/abroad_restriction.png';

  /// If the user is logged in and has authenticated as an adult,
  /// use this image on the thumbnail to indicate that it's an adult stream.
  static const String ageRestrictionTransparent =
      '$_imgPath/age_restriction_transparent.png';

  /// Show that the streamer is a partner.
  static const String verifiedMark = '$_imgPath/verified_mark.png';

  /// Use this if there is no thumnnail for the category.
  static const String categoryBaseThumbnail =
      '$_imgPath/category_base_thumbnail.png';

  /// donation cheese
  static const String cheese = '$_imgPath/cheese.png';
}
