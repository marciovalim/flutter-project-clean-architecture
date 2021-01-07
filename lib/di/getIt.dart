import 'package:dio/dio.dart';
import 'package:flutter_ca_external_search/data/local/datasources/search_datasource.dart';
import 'package:flutter_ca_external_search/data/local/repositories/search_repository_impl.dart';
import 'package:flutter_ca_external_search/data/remote/datasources/github_datasource.dart';
import 'package:flutter_ca_external_search/domain/repositories/search_repository.dart';
import 'package:flutter_ca_external_search/domain/usecases/search_by_text.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class GetItUtils {
  const GetItUtils._();

  static Future<void> setup() async {
    getIt.registerLazySingleton<Dio>(
      () => Dio(),
    );
    getIt.registerLazySingleton<SearchDataSource>(
      () => GithubDataSource(getIt<Dio>()),
    );
    getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt<SearchDataSource>()),
    );
    getIt.registerLazySingleton<SearchByText>(
      () => SearchByTextImpl(getIt<SearchRepository>()),
    );
  }
}
