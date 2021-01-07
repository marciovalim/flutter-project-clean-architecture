import 'package:dartz/dartz.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_ca_external_search/domain/repositories/search_repository.dart';
import 'package:flutter_ca_external_search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

void main() {
  final searchRepository = SearchRepositoryMock();
  when(searchRepository.searchByText(any)).thenAnswer(
    (realInvocation) async => Right(<SearchResult>[]),
  );
  final searchByText = SearchByTextImpl(searchRepository);
  test(
    'Given usecase searchByText When it is called with a text Then return a list of searchResults',
    () async {
      final result = await searchByText.call("clean code");

      expect(result, isA<Right>());
      expect(result | null, isA<List<SearchResult>>());
    },
  );
  test(
    'Given usecase searchByText When it is called with null or empty Then return a searchInvalidTextException',
    () async {
      final resultByNull = await searchByText.call(null);
      final resultByEmpty = await searchByText.call("");

      expect(resultByNull.fold(id, id), isA<SearchInvalidTextException>());
      expect(resultByEmpty.fold(id, id), isA<SearchInvalidTextException>());
    },
  );
}
