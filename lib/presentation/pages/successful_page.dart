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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset(
                      AppAssets.tick,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Successful",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 32),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
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
    );
  }
}
