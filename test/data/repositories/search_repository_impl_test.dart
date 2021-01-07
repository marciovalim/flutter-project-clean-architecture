import 'package:dartz/dartz.dart';
import 'package:flutter_ca_external_search/data/datasources/search_datasource.dart';
import 'package:flutter_ca_external_search/data/models/search_result_model.dart';
import 'package:flutter_ca_external_search/data/repositories/search_repository_impl.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchDatasourceMock extends Mock implements SearchDataSource {}

void main() {
  final datasource = SearchDatasourceMock();
  final searchRepositoryImpl = SearchRepositoryImpl(datasource);

  test(
    'Given a searchRepositoryImpl When searchByText is called Then return list of searchResultModel',
    () async {
      when(datasource.searchByText(any)).thenAnswer(
        (_) async => <SearchResultModel>[],
      );
      final result = await searchRepositoryImpl.searchByText('any text');

      expect(result.fold(id, id), isA<List<SearchResultModel>>());
    },
  );
  test(
    'Given a searchRepositoryImpl When datasource fails Then return searchDatasourceException',
    () async {
      when(datasource.searchByText(any)).thenThrow(
        SearchDatasourceException('Something went wrong'),
      );
      final result = await searchRepositoryImpl.searchByText('any text');

      expect(result.fold(id, id), isA<SearchDatasourceException>());
    },
  );
}
