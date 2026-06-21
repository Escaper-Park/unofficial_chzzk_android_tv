import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/shell/shell.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/ui/ui.dart';
import '../../domain/entities/category_item.dart';
import '../../domain/repositories/category_repository.dart';
import '../bloc/category_bloc.dart';
import '../category_screen_design.dart';
import '../category_screen_string.dart';
import 'layout/category_layout.dart';

part 'category_screen_content.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryBloc(
        repository: context.read<CategoryRepository>(),
      )..add(const CategoryEvent.started()),
      child: const _CategoryScreenView(),
    );
  }
}

class _CategoryScreenView extends HookWidget {
  const _CategoryScreenView();

  @override
  Widget build(BuildContext context) {
    final gridNode = useFocusScopeNode(debugLabel: 'category grid');
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
        duration: CategoryScreenDesign.snackbarDuration,
        onMessageChanged: (message) => snackbarMessage.value = message,
      );
    }

    return BlocConsumer<CategoryBloc, CategoryState>(
      listenWhen: (previous, current) {
        return previous.feedbackSerial != current.feedbackSerial &&
            current.feedbackType != null;
      },
      listener: (context, state) {
        showSnackbar(CategoryScreenString.feedbackMessage(state.feedbackType!));
      },
      builder: (context, state) {
        return AppShellContentBackScope(
          controller: TvBackController(
            onBack: () {
              final navigationNode = AppShellFocusScope.maybeNavigationOf(
                context,
              );
              if (!(navigationNode?.hasFocus ?? false)) {
                navigationNode?.requestFocus();
              }
            },
          ),
          child: _categoryScreenContent(
            context: context,
            state: state,
            gridNode: gridNode,
            snackbarMessage: snackbarMessage.value,
          ),
        );
      },
    );
  }
}
