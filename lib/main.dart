import 'package:flutter/material.dart';
import 'package:uod/injections.dart';

import 'app.dart';

void main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(const MyApp());
}
