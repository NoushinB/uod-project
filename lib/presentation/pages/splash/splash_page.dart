import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uod/core/core.dart';
import 'package:uod/data/data_sources/local/shared_prefs/local_storage_service.dart';
import 'package:uod/presentation/pages/detail/employee_detail_page.dart';
import 'package:uod/presentation/pages/login/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.asset(
                      AppAssets.logo,
                      fit: BoxFit.fill,
                      width: 150,
                      height: 170,
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("UOD", style: TextStyle(color: AppColors.primaryColor, fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ),
              const Text('copyright @ 2022 - Awrosoft', style: TextStyle(fontSize: 12, color: AppColors.primaryColor)),
              const SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  startTimer() async {
    debugPrint("Timer started");
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, doWorkAfterTimerMethod);
  }

  Future<void> doWorkAfterTimerMethod() async {
    debugPrint("Timer completed");
    var _storage = await LocalStorageService?.getInstance();
    var token = _storage?.token;
    if (token == null || token.isEmpty) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployeeDetailPage()));
    }
  }
}
