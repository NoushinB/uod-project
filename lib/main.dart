import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/injections.dart';
import 'package:uod/simple_bloc_observer.dart';

import 'app.dart';

void main() async {
  await init();
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () => {
      runApp(const MyApp()),
    },
    blocObserver: SimpleBlocObserver(),
  );

  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
}
