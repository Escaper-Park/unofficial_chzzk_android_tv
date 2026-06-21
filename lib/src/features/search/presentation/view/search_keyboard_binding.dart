import 'dart:async';

import '../../../../core/tv/keyboard/keyboard.dart';
import '../bloc/search_bloc.dart';

final class SearchKeyboardBinding {
  SearchKeyboardBinding(this._bloc);

  final SearchBloc _bloc;

  TvKeyboardCubit? _cubit;

  TvKeyboardCubit? get cubit => _cubit;

  void sync(SearchState state) {
    if (_cubit?.state.value == state.query) {
      return;
    }

    closeKeyboard();
    _cubit = TvKeyboardCubit(
      initialValue: state.query,
      initialInputMode: TvKeyboardInputMode.korean,
      onChanged: (value) {
        _bloc.add(SearchEvent.keyboardValueChanged(value));
      },
      onSubmitted: (value) {
        _bloc.add(SearchEvent.keyboardSubmitted(value));
      },
      onCancelled: () {
        _bloc.add(const SearchEvent.keyboardClosed());
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
