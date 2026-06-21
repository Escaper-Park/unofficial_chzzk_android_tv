part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.tabSelected(SearchTab tab) = _TabSelected;

  const factory SearchEvent.inputSelected() = _InputSelected;

  const factory SearchEvent.retryRequested() = _RetryRequested;

  const factory SearchEvent.keyboardValueChanged(String value) =
      _KeyboardValueChanged;

  const factory SearchEvent.keyboardSubmitted(String value) =
      _KeyboardSubmitted;

  const factory SearchEvent.keyboardClosed() = _KeyboardClosed;

  const factory SearchEvent.suggestionSelected(String value) =
      _SuggestionSelected;
}
