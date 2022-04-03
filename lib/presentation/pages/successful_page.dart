import 'package:flutter/material.dart';
import 'package:uod/core/core.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/pages/detail/employee_detail_page.dart';

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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: SizedBox(height: 200, width: 200, child: Image.asset(AppAssets.tick))),
            const Expanded(
                child: Text(
              "Successful",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontSize: 32,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MyButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EmployeeDetailPage()));

              }, textName: "Go To Profile"),
            )
          ],
        ),
      ),
    );
  }
}
