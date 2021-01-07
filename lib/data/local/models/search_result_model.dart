import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_ca_external_search/domain/entities/search_result.dart';

class SearchResultModel extends SearchResult {
  final String title;
  final String imageUrl;

  const SearchResultModel({
    @required this.title,
    @required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory SearchResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchResultModel(
      title: map['title'],
      imageUrl: map['imageUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResultModel.fromJson(String source) =>
      SearchResultModel.fromMap(json.decode(source));
}
