import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uod/presentation/themes/app_assets.dart';
import 'package:uod/presentation/themes/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
                    Image.asset(AppAssets.Logo, fit: BoxFit.cover),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("UOD", style: TextStyle(color: AppColors.secondaryColor, fontSize: 32, fontWeight: FontWeight.bold)),
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
    return Timer(_duration, navigateToMainPage);
  }

  Future<void> navigateToMainPage() async {
    debugPrint("Timer completed");
  }
}
