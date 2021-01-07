import 'package:flutter/material.dart';
import 'package:flutter_ca_external_search/domain/entities/search_result.dart';

class SearchResultWidget extends StatelessWidget {
  final SearchResult searchResult;

  const SearchResultWidget(this.searchResult, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(searchResult.login ?? ""),
      leading: CircleAvatar(
        backgroundImage: searchResult.avatarUrl == null
            ? null
            : NetworkImage(searchResult.avatarUrl),
      ),
    );
  }
}
