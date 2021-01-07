import 'package:flutter_ca_external_search/data/models/search_result_model.dart';

abstract class SearchDataSource {
  Future<List<SearchResultModel>> searchByText(String text);
}
