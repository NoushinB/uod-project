import 'package:flutter/material.dart';
import 'package:uod/core/constants/app_colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key,required this.onPressed,required this.textName}) : super(key: key);
  final VoidCallback onPressed;
  final Widget textName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onPressed();
      },
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.all(Radius.circular(6)), boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor,
            offset: Offset(0, 5),
            blurRadius: 6,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: AppColors.lightPrimaryColor,
            offset: Offset(0, 5),
            blurRadius: 6,
            spreadRadius: 2,
          )
        ]),
        child:  textName,
      ),
    );
  }
}
