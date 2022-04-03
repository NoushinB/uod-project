import 'package:flutter/material.dart';
import 'package:uod/presentation/pages/detail/employee_detail_page.dart';
import 'package:uod/presentation/pages/scanner_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "UOD",
      debugShowCheckedModeBanner: false,
      home: EmployeeDetailPage(),
      //home: ScannerPage(),
    );
  }
}
