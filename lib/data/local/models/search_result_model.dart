import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ca_external_search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  final String login;
  final String avatarUrl;

  const SearchResultModel({
    @required this.login,
    @required this.avatarUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'avatar_url': avatarUrl,
    };
  }

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchResultModel(
      login: map['login'],
      avatarUrl: map['avatar_url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultModel.fromJson(String source) =>
      SearchResultModel.fromMap(json.decode(source));
}
