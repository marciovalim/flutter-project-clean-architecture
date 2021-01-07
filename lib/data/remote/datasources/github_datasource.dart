import 'package:dio/dio.dart';
import 'package:flutter_ca_external_search/data/local/datasources/search_datasource.dart';
import 'package:flutter_ca_external_search/data/local/models/search_result_model.dart';
import 'package:flutter_ca_external_search/domain/exceptions/search_exceptions.dart';

class GithubDataSource implements SearchDataSource {
  final Dio dio;

  const GithubDataSource(this.dio);

  @override
  Future<List<SearchResultModel>> searchByText(String text) async {
    final treatedSearchText = _treatText(text);
    final response = await dio.get(
      'https://api.github.com/search/users?q=$treatedSearchText',
    );

    if (response.statusCode == 200) {
      return (response.data["items"] as List)
          .map((item) => SearchResultModel.fromMap(item))
          .toList();
    }

    throw SearchDatasourceException(
      'Something went wrong when retrieving data from github',
    );
  }

  String _treatText(String searchText) {
    return searchText.replaceAll(' ', '+');
  }
}
