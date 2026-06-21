abstract final class CategoryApiPaths {
  static const categories = '/service/v1/categories/live';
  static const categoryInfo =
      '/service/v1/categories/{categoryType}/{categoryId}/info';
  static const categoryLives =
      '/service/v2/categories/{categoryType}/{categoryId}/lives';
  static const categoryVideos =
      '/service/v2/categories/{categoryType}/{categoryId}/videos';
  static const followingCategories = '/service/v1/categories/following';
  static const categoryFollow =
      '/service/v1/categories/{categoryType}/{categoryId}/follow';
}

abstract final class CategoryApiQueryKeys {
  static const size = 'size';
  static const categoryId = 'categoryId';
  static const categoryType = 'categoryType';
  static const concurrentUserCount = 'concurrentUserCount';
  static const openLiveCount = 'openLiveCount';
  static const liveId = 'liveId';
  static const publishDateAt = 'publishDateAt';
  static const readCount = 'readCount';
}

abstract final class CategoryApiPathKeys {
  static const categoryId = 'categoryId';
  static const categoryType = 'categoryType';
}

abstract final class CategoryApiDefaults {
  static const pageSize = 18;
}
