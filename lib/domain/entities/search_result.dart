import 'package:flutter/foundation.dart';

class SearchResult {
  final String login;
  final String avatarUrl;

  const SearchResult({
    @required this.login,
    @required this.avatarUrl,
  });

  @override
  String toString() {
    return '$login';
  }
}
