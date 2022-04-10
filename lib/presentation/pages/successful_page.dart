import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uod/core/core.dart';
import 'package:uod/presentation/components/my_button.dart';

class SuccessfulPage extends StatefulWidget {
  const SuccessfulPage({Key? key}) : super(key: key);

  @override
  State<SuccessfulPage> createState() => _SuccessfulPageState();
}

class _SuccessfulPageState extends State<SuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 64,),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: SvgPicture.asset(
                        AppAssets.tick,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Successful",
                      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor, fontSize: 32),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "Your attendance approved successfully",
                      style: TextStyle( color: AppColors.gray, fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: MyButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Return To Home",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
