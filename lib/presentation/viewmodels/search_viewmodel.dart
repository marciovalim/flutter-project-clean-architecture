import 'package:flutter_ca_external_search/domain/usecases/search_by_text.dart';
import 'package:flutter_ca_external_search/presentation/states/search_state.dart';
import 'package:mobx/mobx.dart';
part 'search_viewmodel.g.dart';

class SearchViewmodel = _SearchViewmodelBase with _$SearchViewmodel;

abstract class _SearchViewmodelBase with Store {
  final SearchByText searchByText;

  var disposer;

  _SearchViewmodelBase(this.searchByText) {
    disposer = reaction(
      (_) => searchText,
      (text) async {
        search();
      },
      delay: 800,
    );
  }

  @observable
  String searchText = "";

  @observable
  SearchState searchState = SearchStateInitial();

  @action
  void setSearchText(String value) => searchText = value;

  @action
  Future<void> search() async {
    searchState = SearchStateLoading();
    final result = await searchByText(searchText);
    result.fold((l) {
      searchState = SearchStateError(l);
    }, (r) {
      searchState = SearchStateLoaded(r);
    });
  }

  void dispose() {
    disposer();
  }
}
