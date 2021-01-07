import 'package:dartz/dartz.dart';

import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_ca_external_search/domain/repositories/search_repository.dart';

abstract class SearchByText {
  Future<Either<SearchException, List<SearchResult>>> call(String text);
}

class SearchByTextImpl implements SearchByText {
  final SearchRepository searchRepository;

  const SearchByTextImpl(this.searchRepository);

  @override
  Future<Either<SearchException, List<SearchResult>>> call(String text) async {
    if (text == null || text.isEmpty) {
      return Left(SearchInvalidTextException(''));
    }
    return searchRepository.searchByText(text);
  }
}
