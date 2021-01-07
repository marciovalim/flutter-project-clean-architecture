import 'package:dartz/dartz.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_ca_external_search/domain/usecases/search_by_text.dart';
import 'package:flutter_ca_external_search/presentation/states/search_state.dart';
import 'package:flutter_ca_external_search/presentation/viewmodels/search_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchByTextMock extends Mock implements SearchByText {}

void main() {
  final searchMock = SearchByTextMock();
  final searchViewmodel = SearchViewmodel(searchMock);
  test(
    'Given searchViewModel When search is called Then searchState is SearchStateLoaded',
    () async {
      when(searchMock.call(any)).thenAnswer(
        (_) async => Right(<SearchResult>[]),
      );

      await searchViewmodel.search();

      expect(searchViewmodel.searchState, isA<SearchStateLoaded>());
    },
  );
  test(
    'Given searchViewModel When search is called and fails Then searchState is SearchStateError',
    () async {
      when(searchMock.call(any)).thenAnswer(
        (_) async => Left(SearchDatasourceException('')),
      );

      await searchViewmodel.search();

      expect(searchViewmodel.searchState, isA<SearchStateError>());
    },
  );
}
