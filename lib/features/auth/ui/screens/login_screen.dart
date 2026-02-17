import 'package:craftybay/core/services/ui/widgets/snack_bar__message.dart';
import 'package:craftybay/features/auth/data/models/login_request_model.dart';
import 'package:craftybay/features/auth/ui/controllers/login_controller.dart';
import 'package:craftybay/features/auth/ui/screens/signup_screen.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/app_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  AppLogo(width: 90, height: 90),
                  Text('Welcome Back', style: theme.titleLarge),

                  Text(
                    'Please enter your e-mail address & password to log in',
                    style: theme.labelMedium,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,

                    controller: _emailController,
                    decoration: InputDecoration(hintText: 'E-mail address'),
                    validator: (String? value) {
                      String email = value ?? " ";
                      if (EmailValidator.validate(email) == false) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  GetBuilder<LoginController>(
                    builder: (_) => TextFormField(
                      textInputAction: TextInputAction.done,
                      controller: _passController,
                      obscureText: Get.find<LoginController>().isObesecureText,

                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: InkWell(
                          onTap: Get.find<LoginController>().changeObsecure,
                          child:
                              Get.find<LoginController>().isObesecureText ==
                                  true
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),

                      validator: (String? value) {
                        if ((value?.trim().isEmpty ?? true) ||
                            (value!.length <= 6)) {
                          return 'Enter your password';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  GetBuilder<LoginController>(
                    builder: (_) => Visibility(
                      visible: Get.find<LoginController>().isProgress == false,
                      replacement: LinearProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapLogin,
                        child: Text(
                          'Login',
                          style: theme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have any account ?'),

                      TextButton(
                        onPressed: _onTapSignUp,
                        child: Text('Sign Up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapLogin() async {
    if (_formKey.currentState!.validate()) {
      final model = LoginRequestModel(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );

      bool isSuccess = await Get.find<LoginController>().login(model);
      if (isSuccess) {
        showSnackMessage(context, Get.find<LoginController>().message);
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainBottomNavScreen.name,
          (predicate) => false,
        );
      } else {
        showSnackMessage(
          context,
          Get.find<LoginController>().errorMessage!,
          true,
        );
      }
    }
  }

  void _onTapSignUp() {
    Navigator.pushReplacementNamed(context, SignupScreen.name);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }
}
