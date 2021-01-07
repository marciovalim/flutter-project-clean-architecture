import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_ca_external_search/data/local/models/search_result_model.dart';
import 'package:flutter_ca_external_search/data/remote/datasources/github_datasource.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../utils/github_search_result.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final githubDatasource = GithubDataSource(dio);

  test(
    'Given a githubDatasource When searchByText is called Then return list of searchResultModel',
    () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: json.decode(githubSearchResult),
          statusCode: 200,
        ),
      );

      final searchResult = await githubDatasource.searchByText('any text');

      expect(searchResult, isA<List<SearchResultModel>>());
    },
  );
  test(
    'Given a githubDatasource When searchByText is called and github api fails Then throw searchDatasourceException',
    () async {
      when(dio.get(any)).thenAnswer(
        (_) async => Response(
          data: {},
          statusCode: 401,
        ),
      );

      final searchFuture = githubDatasource.searchByText('any text');

      expect(searchFuture, throwsA(isA<SearchDatasourceException>()));
    },
  );
}
