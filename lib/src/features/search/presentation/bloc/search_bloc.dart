import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/search_suggestions.dart';
import '../../domain/repositories/search_repository.dart';

part 'search_bloc.freezed.dart';
part 'search_event.dart';
part 'search_bloc_input_helpers.dart';
part 'search_bloc_suggestion_helpers.dart';
part 'search_state.dart';

final class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({
    required this.searchRepository,
    this.autocompleteDebounce = const Duration(milliseconds: 250),
  }) : super(SearchState.initial()) {
    on<_TabSelected>(_onTabSelected, transformer: restartable());
    on<_InputSelected>(_onInputSelected);
    on<_RetryRequested>(_onRetryRequested, transformer: restartable());
    on<_KeyboardValueChanged>(
      _onKeyboardValueChanged,
      transformer: restartable(),
    );
    on<_KeyboardSubmitted>(
      _onKeyboardSubmitted,
      transformer: restartable(),
    );
    on<_KeyboardClosed>(_onKeyboardClosed);
    on<_SuggestionSelected>(_onSuggestionSelected);
  }

  final SearchRepository searchRepository;
  final Duration autocompleteDebounce;
}
