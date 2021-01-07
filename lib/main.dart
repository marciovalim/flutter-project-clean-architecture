import 'package:flutter/widgets.dart';
import 'package:flutter_ca_external_search/di/getIt.dart';
import 'package:flutter_ca_external_search/presentation/app.dart';

void main() async {
  await GetItUtils.setup();
  runApp(App());
}
