import 'package:flutter/material.dart';
import 'package:flutter_ca_external_search/di/getIt.dart';
import 'package:flutter_ca_external_search/presentation/pages/search/search_result_widget.dart';
import 'package:flutter_ca_external_search/presentation/states/search_state.dart';
import 'package:flutter_ca_external_search/presentation/viewmodels/search_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchListWidget extends StatelessWidget {
  const SearchListWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = getIt<SearchViewmodel>();
    return Observer(
      builder: (_) {
        final state = viewmodel.searchState;
        if (state is SearchStateInitial) {
          return Center(child: Text('Search something'));
        }
        if (state is SearchStateLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is SearchStateError) {
          return Text('Something went wrong: ${state.searchException.message}');
        }
        if (state is SearchStateLoaded) {
          final list = state.results;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return SearchResultWidget(list[index]);
            },
          );
        }
        throw UnimplementedError();
      },
    );
  }
}
