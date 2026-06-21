import 'dart:async';

import '../../../../core/tv/keyboard/keyboard.dart';
import '../bloc/group_bloc.dart';

final class GroupKeyboardBinding {
  GroupKeyboardBinding(this._bloc);

  final GroupBloc _bloc;

  TvKeyboardCubit? _cubit;

  TvKeyboardCubit? get cubit => _cubit;

  void sync(GroupState state) {
    if (_cubit?.state.value == state.createInputValue) {
      return;
    }

    closeKeyboard();
    _cubit = TvKeyboardCubit(
      initialValue: state.createInputValue,
      initialInputMode: TvKeyboardInputMode.korean,
      onChanged: (value) {
        _bloc.add(GroupEvent.createInputChanged(value));
      },
      onSubmitted: (value) {
        _bloc.add(GroupEvent.createSubmitted(value));
      },
      onCancelled: () {
        _bloc.add(const GroupEvent.keyboardClosed());
      },
    );
  }

  void closeKeyboard() {
    final cubit = _cubit;
    if (cubit != null) {
      unawaited(cubit.close());
    }
    _cubit = null;
  }

  void dispose() {
    closeKeyboard();
  }
}
