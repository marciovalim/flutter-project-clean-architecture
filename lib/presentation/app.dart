import 'package:flutter/material.dart';
import 'package:flutter_ca_external_search/di/getIt.dart';
import 'package:flutter_ca_external_search/presentation/pages/search/search_page.dart';
import 'package:flutter_ca_external_search/presentation/viewmodels/search_viewmodel.dart';

class App extends StatefulWidget {
  const App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobx Github Search",
      home: SearchPage(),
    );
  }

  @override
  void dispose() {
    getIt<SearchViewmodel>().dispose();
    super.dispose();
  }
}
