import 'package:flutter/material.dart';
import 'package:uod/core/constants/app_colors.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? title;
  final bool isBusy;

  const MyButton({Key? key, required this.onPressed, this.title, this.isBusy = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: AppColors.white,
            offset: Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
          highlightColor: Colors.transparent,
          onTap: onPressed,
          child: Center(
            child: isBusy
                ? const SizedBox(width: 32, height: 32, child: CircularProgressIndicator(color: Colors.white))
                : Text(
                    title ?? "",
                    style: const TextStyle(fontSize: 16, color: AppColors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
