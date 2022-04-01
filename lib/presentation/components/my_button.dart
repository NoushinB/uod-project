import 'package:flutter/material.dart';
import 'package:uod/core/constants/app_colors.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String textName;

  const MyButton({Key? key, required this.onPressed, required this.textName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: const BoxDecoration(color: AppColors.primaryColor, borderRadius: BorderRadius.all(Radius.circular(32)), boxShadow: [
          BoxShadow(
            color: AppColors.white,
            offset: Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ]),
        child: Center(
          child: Text(
            textName,
            style: const TextStyle(fontSize: 16, color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
