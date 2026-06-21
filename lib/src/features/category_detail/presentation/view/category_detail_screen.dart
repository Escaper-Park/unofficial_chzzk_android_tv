import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/ui.dart';
import '../../../auth/presentation/bloc/auth_session_bloc.dart';
import '../../../category/domain/repositories/category_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../../vod/presentation/vod_player_entry_flow.dart';
import '../bloc/category_detail_bloc.dart';
import '../category_detail_screen_design.dart';
import '../category_detail_screen_string.dart';
import '../category_detail_screen_ui_mapper.dart';
import 'layout/category_detail_layout.dart';
import 'sections/grid/category_detail_card_mapper.dart';
import 'sections/header/category_detail_header.dart';

part 'category_detail_screen_content.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({
    super.key,
    required this.categoryType,
    required this.categoryId,
  });

  final String categoryType;
  final String categoryId;

  @override
  Widget build(BuildContext context) {
    final isSignedIn = context.read<AuthSessionBloc>().state.hasRequiredCookies;

    return BlocProvider(
      create: (context) =>
          CategoryDetailBloc(
            repository: context.read<CategoryRepository>(),
            initialIsSignedIn: isSignedIn,
          )..add(
            CategoryDetailEvent.started(
              categoryType: categoryType,
              categoryId: categoryId,
              isSignedIn: isSignedIn,
            ),
          ),
      child: const _CategoryDetailScreenView(),
    );
  }
}

class _CategoryDetailScreenView extends HookWidget {
  const _CategoryDetailScreenView();

  @override
  Widget build(BuildContext context) {
    final tabsNode = useFocusScopeNode(debugLabel: 'category detail tabs');
    final gridNode = useFocusScopeNode(debugLabel: 'category detail grid');
    final handledFeedbackSerial = useRef(0);
    final snackbarMessage = useState<String?>(null);
    final snackbarFeedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );

    useEffect(() {
      return snackbarFeedbackController.dispose;
    }, [snackbarFeedbackController]);

    void showSnackbar(String message) {
      snackbarFeedbackController.showMessage(
        message: message,
        duration: CategoryDetailScreenDesign.snackbarDuration,
        onMessageChanged: (message) => snackbarMessage.value = message,
      );
    }

    return BlocListener<AuthSessionBloc, AuthSessionState>(
      listenWhen: (previous, current) {
        return previous.hasRequiredCookies != current.hasRequiredCookies;
      },
      listener: (context, state) {
        context.read<CategoryDetailBloc>().add(
          CategoryDetailEvent.authStateChanged(
            isSignedIn: state.hasRequiredCookies,
          ),
        );
      },
      child: BlocConsumer<CategoryDetailBloc, CategoryDetailState>(
        listenWhen: (previous, current) {
          return previous.feedbackSerial != current.feedbackSerial &&
              current.feedbackType != null;
        },
        listener: (context, state) {
          final feedbackType = state.feedbackType;
          if (feedbackType != null &&
              handledFeedbackSerial.value != state.feedbackSerial) {
            handledFeedbackSerial.value = state.feedbackSerial;
            showSnackbar(categoryDetailFeedbackMessage(feedbackType));
          }
        },
        builder: (context, state) {
          return TvScaffold(
            backController: TvBackController(
              onBack: () {
                _handleBack(
                  context: context,
                  tabsNode: tabsNode,
                  gridNode: gridNode,
                );
              },
            ),
            body: Stack(
              children: _categoryDetailScreenContent(
                context: context,
                state: state,
                tabsNode: tabsNode,
                gridNode: gridNode,
                snackbarMessage: snackbarMessage.value,
              ),
            ),
          );
        },
      ),
    );
  }
}

void _handleBack({
  required BuildContext context,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
}) {
  if (gridNode.hasFocus) {
    requestTvSectionFocus(tabsNode);
    return;
  }

  _popOrCategory(context);
}

void _popOrCategory(BuildContext context) {
  if (context.canPop()) {
    context.pop();
    return;
  }

  context.go(AppRoute.category.path);
}

Future<void> _handleFollowPressed({
  required BuildContext context,
  required CategoryDetailState state,
}) async {
  if (!state.canUseFollowAction) {
    return;
  }

  if (!state.isFollowing) {
    context.read<CategoryDetailBloc>().add(
      const CategoryDetailEvent.followToggled(),
    );
    return;
  }

  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: CategoryDetailScreenString.unfollowDialogTitle,
    content: CategoryDetailScreenString.unfollowDialogContent,
    primaryLabel: CategoryDetailScreenString.unfollowConfirm,
    secondaryLabel: CategoryDetailScreenString.unfollowCancel,
    icon: Icons.favorite_border_rounded,
  );

  if (!context.mounted || result != TvDialogResult.primary) {
    return;
  }

  context.read<CategoryDetailBloc>().add(
    const CategoryDetailEvent.followToggled(),
  );
}
