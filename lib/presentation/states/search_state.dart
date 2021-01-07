import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';

abstract class SearchState {}

class SearchStateInitial extends SearchState {}

class SearchStateLoading extends SearchState {}

class SearchStateLoaded extends SearchState {
  final List<SearchResult> results;

  SearchStateLoaded(this.results);
}

class SearchStateError extends SearchState {
  final SearchException searchException;

  SearchStateError(this.searchException);
}
