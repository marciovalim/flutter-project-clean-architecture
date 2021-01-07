abstract class SearchException implements Exception {}

class SearchInvalidTextException extends SearchException {}

class SearchDatasourceException extends SearchException {
  final String message;

  SearchDatasourceException(this.message);
}
