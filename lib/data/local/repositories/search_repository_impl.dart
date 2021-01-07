import 'package:flutter_ca_external_search/data/local/datasources/search_datasource.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_ca_external_search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchDataSource searchDataSource;

  const SearchRepositoryImpl(this.searchDataSource);

  @override
  Future<Either<SearchException, List<SearchResult>>> searchByText(
    String text,
  ) async {
    try {
      final result = await searchDataSource.searchByText(text);
      return Right(result);
    } on SearchDatasourceException catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(SearchDatasourceException(e.toString()));
    }
  }
}
