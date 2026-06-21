import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/category_detail_bloc.dart';
import '../../../category_detail_screen_design.dart';
import '../../../category_detail_screen_string.dart';
import '../../../category_detail_screen_ui_mapper.dart';

class CategoryDetailHeader extends StatelessWidget {
  const CategoryDetailHeader({
    super.key,
    required this.state,
  });

  final CategoryDetailState state;

  @override
  Widget build(BuildContext context) {
    final info = state.info;
    final title = info?.title.trim().isNotEmpty == true
        ? info!.title
        : state.categoryId.isEmpty
        ? CategoryDetailScreenString.fallbackTitle
        : state.categoryId;
    final posterImageUrl = chzzkImageUrlWithType(
      info?.posterImageUrl,
      ChzzkImageVariant.categoryPoster,
    );
    final headerText = info == null
        ? const SizedBox.shrink()
        : _CategoryDetailHeaderText(
            title: title,
            openLiveCount: info.openLiveCount,
            concurrentUserCount: info.concurrentUserCount,
          );

    return SizedBox(
      height: CategoryDetailScreenDesign.headerHeight,
      child: Padding(
        padding: CategoryDetailScreenDesign.headerPadding,
        child: Align(
          alignment: Alignment.topLeft,
          child: SizedBox(
            height: CategoryDetailScreenDesign.headerContentHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _CategoryDetailPoster(imageUrl: posterImageUrl),
                const SizedBox(
                  width: CategoryDetailScreenDesign.headerContentGap,
                ),
                Expanded(child: headerText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CategoryDetailPoster extends StatelessWidget {
  const _CategoryDetailPoster({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: CategoryDetailScreenDesign.headerPosterRadius,
      child: SizedBox(
        width: CategoryDetailScreenDesign.headerPosterWidth,
        height: CategoryDetailScreenDesign.headerPosterHeight,
        child: TvMediaThumbnail(
          imageUrl: imageUrl,
          fallbackIcon: Icons.category_rounded,
        ),
      ),
    );
  }
}

class _CategoryDetailHeaderText extends StatelessWidget {
  const _CategoryDetailHeaderText({
    required this.title,
    required this.openLiveCount,
    required this.concurrentUserCount,
  });

  final String title;
  final int openLiveCount;
  final int concurrentUserCount;

  @override
  Widget build(BuildContext context) {
    final openLiveLabel = CategoryDetailScreenString.openLiveCount(
      formatCategoryDetailCount(openLiveCount),
    );
    final viewerLabel = CategoryDetailScreenString.viewerCount(
      formatCategoryDetailCount(concurrentUserCount),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: CategoryDetailScreenDesign.headerTitleStyle(context),
        ),
        const Spacer(),
        Row(
          children: [
            _CategoryDetailMetric(
              icon: Icons.live_tv_rounded,
              label: openLiveLabel,
            ),
            const SizedBox(width: CategoryDetailScreenDesign.headerMetricGap),
            _CategoryDetailMetric(
              icon: Icons.visibility_rounded,
              label: viewerLabel,
            ),
          ],
        ),
      ],
    );
  }
}

class _CategoryDetailMetric extends StatelessWidget {
  const _CategoryDetailMetric({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurfaceVariant;

    return Flexible(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: CategoryDetailScreenDesign.headerMetricIconSize,
            color: color,
          ),
          const SizedBox(
            width: CategoryDetailScreenDesign.headerMetricIconGap,
          ),
          Flexible(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: CategoryDetailScreenDesign.headerMetricStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
