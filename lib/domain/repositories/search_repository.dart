import 'package:dartz/dartz.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';

abstract class SearchRepository {
  Future<Either<SearchException, List<SearchResult>>> searchByText(String text);
}
