import 'package:flutter/material.dart';
import 'package:uod/core/constants/app_assets.dart';
import 'package:uod/core/constants/app_colors.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.width;
    var padding = deviceHeight / 12;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 90,
                height: 120,
                child: Image.asset(AppAssets.logo),
              ),
              const SizedBox(height: 64),
              MyTextFormField(
                  icon: Icons.account_circle_outlined,
                  hintText: "Input userName",
                  controller: _userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              MyTextFormField(
                  icon: Icons.lock_outline,
                  hintText: "Input Password",
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  }),
              const SizedBox(height: 16),
              MyButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                textName: "Login",
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password?", style: TextStyle(color: AppColors.errorColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
