import 'package:flutter/material.dart';
import 'package:uod/core/constants/app_colors.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/pages/detail/event_detail_page.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key? key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.width;
var padding=deviceHeight/12;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32,left: 16,right: 16,top: 8),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor),
                  borderRadius: BorderRadius.circular(16)
                ),

                ),
              ),
            ),
            const SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: MyButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const EventDetailPage()));
              }, textName: "Ok",),
            ),
          ],
        ),
      ),
    );
  }
}
