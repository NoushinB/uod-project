import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:uod/core/core.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/my_text_field.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _phoneController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.lock),
        const SizedBox(height: 32),
        const Text(
          "Password recovery",
          style: TextStyle(fontSize: 32, color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            "Enter your Phone number to recover your password",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.gray,
            ),
          ),
        ),
        const SizedBox(height: 24),
        MyTextFormField(
            icon: Icons.mail_outline_outlined,
            hintText: "Email,Phone",
            controller: _phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: MyButton(
            onPressed: () {},
            title: "Send Login Link",
          ),
        ),
      ],
    );
  }
}
