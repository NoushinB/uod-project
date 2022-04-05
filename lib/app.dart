import 'package:flutter/material.dart';
import 'package:uod/presentation/pages/splash/splash_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UOD",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
