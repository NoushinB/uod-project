import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uod/core/constants/app_assets.dart';
import 'package:uod/core/constants/app_colors.dart';
import 'package:uod/presentation/components/my_button.dart';

class NotConnectedView extends StatelessWidget {
  final VoidCallback tryAgain;

  const NotConnectedView({Key? key, required this.tryAgain}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 64),
                SvgPicture.asset(AppAssets.notConnected, height: 150, width: 150),
                const SizedBox(height: 32),
                const Text(
                  "Connection Lost!",
                  style: TextStyle(fontSize: 32, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    "No internet connection, please check your network connection.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: MyButton(
              onPressed: tryAgain,
              title: "Try Again",
            ),
          ),
        ],
      ),
    );
  }
}
