// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchViewmodel on _SearchViewmodelBase, Store {
  final _$searchTextAtom = Atom(name: '_SearchViewmodelBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$searchStateAtom = Atom(name: '_SearchViewmodelBase.searchState');

  @override
  SearchState get searchState {
    _$searchStateAtom.reportRead();
    return super.searchState;
  }

  @override
  set searchState(SearchState value) {
    _$searchStateAtom.reportWrite(value, super.searchState, () {
      super.searchState = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_SearchViewmodelBase.search');

  @override
  Future<void> search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  final _$_SearchViewmodelBaseActionController =
      ActionController(name: '_SearchViewmodelBase');

  @override
  void setSearchText(String value) {
    final _$actionInfo = _$_SearchViewmodelBaseActionController.startAction(
        name: '_SearchViewmodelBase.setSearchText');
    try {
      return super.setSearchText(value);
    } finally {
      _$_SearchViewmodelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchText: ${searchText},
searchState: ${searchState}
    ''';
  }
}
