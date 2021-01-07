import 'package:flutter/material.dart';
import 'package:flutter_ca_external_search/di/getIt.dart';
import 'package:flutter_ca_external_search/presentation/pages/search/search_list_widget.dart';
import 'package:flutter_ca_external_search/presentation/viewmodels/search_viewmodel.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchViewmodel = getIt<SearchViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: searchViewmodel.setSearchText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            hintStyle: TextStyle(color: Colors.white38),
            hintText: 'Search...',
          ),
          cursorColor: Colors.white,
        ),
      ),
      body: SearchListWidget(),
    );
  }
}
