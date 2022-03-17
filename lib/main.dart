import 'package:flutter/material.dart';

import 'app.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
  runApp(const MyApp());
}