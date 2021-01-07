import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ca_external_search/di/getIt.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';
import 'package:flutter_ca_external_search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/github_search_result.dart';

class DioMock extends Mock implements Dio {}

void main() async {
  await GetItUtils.setup();
  final dioMock = DioMock();
  getIt.unregister<Dio>();
  getIt.registerLazySingleton<Dio>(
    () => dioMock,
  );

  test(
    'Given getIt instance When called to get searchByText usecase Then should get usecase',
    () {
      final searchByText = getIt<SearchByText>();

      expect(searchByText, isA<SearchByText>());
    },
  );

  test(
    'Given searchByText usecase When call is called Then should get list of searchResult',
    () async {
      final searchByText = getIt<SearchByText>();
      when(dioMock.get(any)).thenAnswer(
        (_) async => Response(
          data: json.decode(githubSearchResult),
          statusCode: 200,
        ),
      );

      final result = await searchByText("marcio va");

      expect(result.fold(id, id), isA<List<SearchResult>>());
    },
  );
}
