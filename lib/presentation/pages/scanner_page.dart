import 'package:flutter/material.dart';
import 'package:uod/presentation/components/my_button.dart';

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
      body: Column(
        children: [
          Container(
          width: padding,

          ),
          const SizedBox(height: 64,),
          MyButton(onPressed: (){}, textName: "Ok"),
        ],
      ),
    );
  }
}
