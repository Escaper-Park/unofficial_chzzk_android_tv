import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../app/shell/shell.dart';
import '../../../../core/tv/back/back.dart';
import '../../../../core/tv/focus/focus.dart';
import '../../../../core/tv/keyboard/keyboard.dart';
import '../../../../core/ui/ui.dart';
import '../../../channel/domain/repositories/channel_repository.dart';
import '../../../live/presentation/live_player_entry_flow.dart';
import '../../domain/entities/group_collection.dart';
import '../../domain/repositories/group_repository.dart';
import '../bloc/group_bloc.dart';
import '../group_screen_design.dart';
import '../group_screen_string.dart';
import '../group_screen_ui_mapper.dart';
import '../models/group_screen_models.dart';
import 'group_keyboard_binding.dart';
import 'layout/group_layout.dart';
import 'sections/group_content/group_channel_modal.dart';
import 'sections/keyboard/group_keyboard_overlay.dart';
import 'shared/group_channel_focus_registry.dart';

part 'group_screen_channel_modal_host.dart';
part 'group_screen_content.dart';
part 'group_screen_helpers.dart';
part 'group_screen_load_surface.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupBloc(
        groupRepository: context.read<GroupRepository>(),
        channelRepository: context.read<ChannelRepository>(),
      )..add(const GroupEvent.started()),
      child: const _GroupScreenView(),
    );
  }
}

class _GroupScreenView extends HookWidget {
  const _GroupScreenView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GroupBloc>();
    final tabsNode = useFocusScopeNode(debugLabel: 'group tabs');
    final groupListNode = useFocusScopeNode(debugLabel: 'group list');
    final groupContentNode = useFocusScopeNode(debugLabel: 'group content');
    final createNode = useFocusScopeNode(debugLabel: 'group create');
    final keyboardNode = useFocusScopeNode(debugLabel: 'group keyboard');
    final modalNode = useFocusScopeNode(debugLabel: 'group channel modal');
    final groupFirstNode = useFocusNode(debugLabel: 'group first item');
    final contentFirstNode = useFocusNode(
      debugLabel: 'group content first item',
    );
    final keyboardBinding = useMemoized(
      () => GroupKeyboardBinding(bloc),
      [bloc],
    );
    final focusRegistry = useMemoized(GroupChannelFocusRegistry.new);
    final snackbarMessage = useState<String?>(null);
    final snackbarFeedbackController = useMemoized(
      TvSnackbarFeedbackController.new,
      const [],
    );
    final handledFeedbackSerial = useRef(0);
    final lastChannelModalChannelId = useRef<String?>(null);

    useEffect(() {
      return () {
        snackbarFeedbackController.dispose();
        keyboardBinding.dispose();
        focusRegistry.dispose();
      };
    }, [snackbarFeedbackController, keyboardBinding, focusRegistry]);

    void showSnackbar(String message) {
      snackbarFeedbackController.showMessage(
        message: message,
        duration: GroupScreenDesign.snackbarDuration,
        onMessageChanged: (message) => snackbarMessage.value = message,
      );
    }

    return BlocConsumer<GroupBloc, GroupState>(
      listenWhen: (previous, current) {
        return previous.isKeyboardOpen != current.isKeyboardOpen ||
            previous.createInputValue != current.createInputValue ||
            previous.feedbackSerial != current.feedbackSerial ||
            previous.activeChannelModal != current.activeChannelModal;
      },
      listener: (context, state) {
        if (state.isKeyboardOpen) {
          keyboardBinding.sync(state);
          requestTvSectionFocus(keyboardNode);
        } else {
          keyboardBinding.closeKeyboard();
        }

        final feedbackType = state.feedbackType;
        if (feedbackType != null &&
            handledFeedbackSerial.value != state.feedbackSerial) {
          handledFeedbackSerial.value = state.feedbackSerial;
          showSnackbar(groupFeedbackMessage(feedbackType));
          _restoreFocusAfterFeedback(
            feedbackType: feedbackType,
            groupListNode: groupListNode,
            groupContentNode: groupContentNode,
          );
        }

        final activeModal = state.activeChannelModal;
        if (activeModal == null) {
          final channelId = lastChannelModalChannelId.value;
          if (channelId != null) {
            focusRegistry.maybeNodeFor(channelId)?.requestFocus();
            lastChannelModalChannelId.value = null;
          }
        } else {
          lastChannelModalChannelId.value = activeModal.channel.channelId;
          modalNode.requestFocus();
        }
      },
      builder: (context, state) {
        final keyboardCubit = keyboardBinding.cubit;
        final activeModal = state.activeChannelModal;
        final activeModalGroup = _groupById(
          state.groups,
          activeModal?.groupId,
        );

        return AppShellContentBackScope(
          controller: TvBackController(
            onBack: () {
              _handleBack(
                context: context,
                state: state,
                tabsNode: tabsNode,
                groupListNode: groupListNode,
                groupContentNode: groupContentNode,
                createNode: createNode,
                focusRegistry: focusRegistry,
              );
            },
          ),
          child: _groupScreenContent(
            context: context,
            bloc: bloc,
            state: state,
            keyboardCubit: keyboardCubit,
            activeModal: activeModal,
            activeModalGroup: activeModalGroup,
            tabsNode: tabsNode,
            groupListNode: groupListNode,
            groupContentNode: groupContentNode,
            createNode: createNode,
            keyboardNode: keyboardNode,
            modalNode: modalNode,
            groupFirstNode: groupFirstNode,
            contentFirstNode: contentFirstNode,
            focusRegistry: focusRegistry,
            snackbarMessage: snackbarMessage.value,
          ),
        );
      },
    );
  }
}
