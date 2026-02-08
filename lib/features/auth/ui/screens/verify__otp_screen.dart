import 'package:craftybay/app/appColor.dart';
import 'package:craftybay/core/services/ui/widgets/snack_bar__message.dart';
import 'package:craftybay/features/auth/data/models/verify_otp_request.dart';
import 'package:craftybay/features/auth/ui/controllers/verify_otp_controller.dart';
import 'package:craftybay/features/common/ui/screens/main_bottom_nav_screen.dart';

import 'package:craftybay/features/home/ui/screens/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/app_logo.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String email;
  const VerifyOtpScreen({super.key, required this.email});

  static final name = '/verify_otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _otpController = .new();
  final _controller = Get.find<VerifyOtpController>();
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
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 80),
                  AppLogo(width: 90, height: 90),
                  Text('Verify Otp', style: theme.titleLarge),

                  Text(
                    'Please enter your 4 digit OTP sent to your  ${widget.email}',
                    style: theme.labelMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  PinCodeTextField(
                    controller: _otpController,
                    length: 4,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    animationDuration: Duration(milliseconds: 300),
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    keyboardType: TextInputType.number,
                    appContext: context,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 50,
                      fieldWidth: 50,
                      errorBorderColor: Colors.red,
                      inactiveColor: Colors.grey,
                      activeColor: Colors.green,
                      selectedColor: AppColor.themeColor,
                    ),
                  ),
                  SizedBox(height: 24),

                  SizedBox(height: 16),
                  GetBuilder<VerifyOtpController>(
                    builder: (_) => Visibility(
                      visible: _controller.inProgress == false,
                      replacement: CircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapVerify,
                        child: Text(
                          'Verify',
                          style: theme.labelLarge!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapVerify() async {
    if (_formkey.currentState!.validate()) {
      final model = VerifyOtpRequestModel(
        email: widget.email,
        otp: _otpController.text.trim(),
      );
      bool isSuccess = await _controller.verifyOtp(model);

      if (isSuccess) {
        showSnackMessage(context, _controller.message);
        Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
      } else {
        showSnackMessage(context, _controller.errorMessage!, true);
      }
    }
  }
}
