import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uod/core/constants/app_assets.dart';
import 'package:uod/core/constants/app_colors.dart';
import 'package:uod/presentation/components/my_button.dart';

class NotConnectedView extends StatelessWidget {
  const NotConnectedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.notConnected, height: 150, width: 150),
          const SizedBox(height: 32),
          const Text(
            "Connection Lost!",
            style: TextStyle(fontSize: 32, color: AppColors.primaryColor,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 8.0,right: 8.0),
            child: Text(
              "No internet connection,check the connection to your network.",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.gray,
              ),
            ),
          ),
          const SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(onPressed: () {}, textName: "Try again"),
          ),
        ],
      ),
    );
  }
}
