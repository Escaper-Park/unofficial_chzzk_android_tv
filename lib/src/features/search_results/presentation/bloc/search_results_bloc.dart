import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/search_results.dart';
import '../../domain/repositories/search_results_repository.dart';

part 'search_results_bloc.freezed.dart';
part 'search_results_event.dart';
part 'search_results_bloc_load_helpers.dart';
part 'search_results_bloc_mapping_helpers.dart';
part 'search_results_state.dart';

final class SearchResultsBloc
    extends Bloc<SearchResultsEvent, SearchResultsState> {
  SearchResultsBloc({
    required this.repository,
  }) : super(SearchResultsState.initial()) {
    on<_Started>(_onStarted);
    on<_RetryRequested>(_onRetryRequested);
  }

  final SearchResultsRepository repository;

  static const _pageSize = 18;
  var _loadSerial = 0;
}
