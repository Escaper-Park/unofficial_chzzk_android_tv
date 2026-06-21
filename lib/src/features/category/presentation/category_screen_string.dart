import 'bloc/category_bloc.dart';

abstract final class CategoryScreenString {
  static const loading = '카테고리를 불러오는 중입니다';
  static const empty = '표시할 카테고리가 없습니다';
  static const error = '카테고리를 불러오지 못했습니다';
  static const retry = '다시 시도';
  static const noMoreData = '더 이상 불러올 카테고리가 없습니다';
  static const loadMoreFailure = '카테고리를 더 불러오지 못했습니다';
  static const tenThousandUnit = '만';
  static const thousandUnit = '천';

  static String feedbackMessage(CategoryFeedbackType type) {
    return switch (type) {
      CategoryFeedbackType.noMoreData => noMoreData,
      CategoryFeedbackType.loadMoreFailure => loadMoreFailure,
    };
  }
}
