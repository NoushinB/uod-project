import 'package:flutter/material.dart';

import 'presentation/pages/home/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UOD",
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
