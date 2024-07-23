class AssetsPath {
  static const String _imgPath = 'assets/images';

  static const String logoIcon = '$_imgPath/logo_icon.png';
  static const String logoHeader = '$_imgPath/logo_text.gif';

  /// If the user is not logged in, or doesn't has adult auth,
  /// prevent users from watching adult auth stream.
  static const String ageRestriction = '$_imgPath/age_restriction.png';

  /// If the user has auth as an adult, and the streaming's adult value is true,
  /// this mark is displayed on the thumbnail.
  static const String ageRestrictionTransprent =
      '$_imgPath/age_restriction_transparent.png';

  /// Partner streamer's mark.
  static const String verifiedMark = '$_imgPath/verified_mark.png';

  /// Use this if the thumbnail for that category doesn't exist.
  static const String categoryBaseThumbnail =
      '$_imgPath/category_base_thumbnail.png';
}
