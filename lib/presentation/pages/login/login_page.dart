import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uod/core/core.dart';
import 'package:uod/core/utils/enums/bloc_status.dart';
import 'package:uod/data/data_sources/local/shared_prefs/local_storage_service.dart';
import 'package:uod/injections.dart';
import 'package:uod/presentation/bloc/login/login_bloc.dart';
import 'package:uod/presentation/bloc/login/login_event.dart';
import 'package:uod/presentation/bloc/login/login_state.dart';
import 'package:uod/presentation/components/my_button.dart';
import 'package:uod/presentation/components/my_text_field.dart';
import 'package:uod/presentation/pages/detail/employee_detail_page.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var padding = deviceHeight / 9;
    return BlocListener(
      bloc: context.read<LoginBloc>(),
      listener: (BuildContext context, LoginState state) async {
        if (state.status == BlocStatus.loaded) {
          var _storage = await LocalStorageService.getInstance();
          var token = state.token?.accessToken;
          if (token != null) {
            _storage?.token = token;
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EmployeeDetailPage()));
          }
        }

        if (state.status == BlocStatus.error) {
          if (state.failure is NotConnectedFailure) {
            Fluttertoast.showToast(msg: "You are not connected to internet");
          } else {
            Fluttertoast.showToast(msg: "Error Occurred. Check your username/password");
          }
        }
      },
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 64),
                      SizedBox(
                        width: 110,
                        height: 140,
                        child: Image.asset(AppAssets.logo),
                      ),
                      const SizedBox(height: 8),
                      const Text("Login", style: TextStyle(color: AppColors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 48),
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
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          }),
                      const SizedBox(height: 48),
                      BlocBuilder(
                        bloc: context.read<LoginBloc>(),
                        builder: (BuildContext context, LoginState state) {
                          return MyButton(
                            onPressed: () {
                              if (state.status != BlocStatus.loading) {
                                if (_formKey.currentState!.validate()) {
                                  // Get username and password
                                  var userName = _userNameController.text;
                                  var password = _passwordController.text;

                                  // Get login bloc instance
                                  var loginBloc = context.read<LoginBloc>();

                                  // Send event to get token
                                  loginBloc.add(GetToken(username: userName, password: password));
                                }
                              }
                            },
                            title: "Login",
                            isBusy: state.status == BlocStatus.loading,
                          );
                        },
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordRecovery()));
                            _launchURL(NetworkPath.forgotPasswordUrl);
                          },
                          child: const Text("Forgot Password?", style: TextStyle(color: AppColors.errorColor)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      Fluttertoast.showToast(msg: "You can't launch this url on your device");
    }
  }
}
