import 'package:craftybay/features/ui/screens/home_screen.dart';
import 'package:craftybay/features/ui/screens/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static final name = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // Editing Controller initializing
  final TextEditingController _emailController = .new();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _rePassController = TextEditingController();
  final TextEditingController _firstNController = TextEditingController();
  final TextEditingController _lastNController = TextEditingController();
  final TextEditingController _mobileNController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  AppLogo(width: 90, height: 90),
                  Text('Register Account', style: theme.titleLarge),

                  Text(
                    'Please enter your details to sign up',
                    style: theme.labelMedium,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
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

                  TextFormField(
                    controller: _firstNController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First Name'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter a valid first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNController,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last Name'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter a valid last name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _mobileNController,

                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Mobile'),
                    validator: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter a valid mobile number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'City'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter a valid city';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _passController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Password'),

                    validator: (String? value) {
                      if ((value?.trim().isEmpty == true) ||
                          (value!.length <= 6)) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _rePassController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: ' Re-enter your Password',
                    ),

                    validator: (String? value) {
                      if (value != _passController.text) {
                        return 'Doesn\'t match with your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _addressController,
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.done,
                    maxLines: 3,

                    decoration: InputDecoration(
                      hintText: 'Shipping Address',
                      contentPadding: EdgeInsetsGeometry.all(16),
                    ),

                    validator: (String? value) {
                      if ((value?.trim().isEmpty ?? true)) {
                        return 'Enter your  valid address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _onTapSignUp,
                    child: Text(
                      'Sign Up',
                      style: theme.labelLarge!.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account ?'),

                      TextButton(onPressed: _onTapLogin, child: Text('Log In')),
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

  void _onTapLogin() {
    Navigator.pushReplacementNamed(context, LoginScreen.name);
  }

  void _onTapSignUp() {
    Navigator.pushReplacementNamed(context, HomeScreen.name);
  }
}
