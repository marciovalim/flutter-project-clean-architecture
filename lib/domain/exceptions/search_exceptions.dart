abstract class SearchException implements Exception {
  final String message;

  SearchException(this.message);
}

class SearchInvalidTextException extends SearchException {
  SearchInvalidTextException(String message) : super(message);
}

class SearchDatasourceException extends SearchException {
  SearchDatasourceException(String message) : super(message);
}
