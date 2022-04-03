import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uod/core/constants/app_assets.dart';
import 'package:uod/core/constants/app_colors.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/login/login_bloc.dart';
import 'package:uod/presentation/bloc/login/login_event.dart';
import 'package:uod/presentation/bloc/login/login_state.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<LoginBloc>(),
        child: const LoginView(),
      ),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.width;
    var padding = deviceHeight / 12;
    return BlocListener(
      bloc: context.read<LoginBloc>(),
      listener: (BuildContext context, LoginState state) {
        if (state.status == BlocStatus.loaded) {
          var token = state.token?.accessToken;
          // TODO: save token here in sharedPreferences
          // TODO: Go to home page (Navigate)
        }

        if (state.status == BlocStatus.error) {
          var error = state.failure;
          // TODO: Show error message to user
        }
      },
      child: Padding(
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
              BlocBuilder(
                bloc: context.read<LoginBloc>(),
                builder: (BuildContext context, LoginState state) {
                  var titleOnLine = state.status == BlocStatus.loading ? "Loading..." : "Login";
                  return MyButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Get username and password
                        var userName = _userNameController.text;
                        var password = _passwordController.text;

                        // Get login bloc instance
                        var loginBloc = context.read<LoginBloc>();

                        // Send event to get token
                        loginBloc.add(GetToken(username: userName, password: password));
                      }
                    },
                    textName: titleOnLine,
                  );
                },
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
