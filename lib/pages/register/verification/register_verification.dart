import 'dart:async';

import 'package:blueray_test_project/controllers/register_controller.dart';
import 'package:blueray_test_project/pages/register/verification/verification_success.dart';
import 'package:blueray_test_project/pages/register/widgets/login_button.dart';
import 'package:blueray_test_project/pages/starting/widgets/password_textfield.dart';
import 'package:blueray_test_project/pages/starting/widgets/register_button.dart';
import 'package:blueray_test_project/pages/starting/widgets/user_id_textfield.dart';
import 'package:blueray_test_project/ui/page_transitions/vertical_page_transition.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class RegisterVerificationPage extends ConsumerStatefulWidget {
  const RegisterVerificationPage({super.key});

  @override
  ConsumerState<RegisterVerificationPage> createState() =>
      _RegisterVerificationPageState();
}

class _RegisterVerificationPageState
    extends ConsumerState<RegisterVerificationPage> {
  bool isResent = false;

  String timerText = "30s";
  Timer? resendTimer;

  void startResendTimer() {
    setState(() {
      isResent = true;
      timerText = "30s";
    });

    int timeLeft = 30;

    resendTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
          timerText = "${timeLeft}s";
        });
      } else {
        resendTimer?.cancel();
        setState(() {
          isResent = false;
        });
      }
    });
  }

  Future<void> insertCode() async {
    final registerState = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);

    if (registerState.registrationCode.isEmpty) {
      showSnackBar(
          context: context,
          message: 'Field is empty!',
          textColor: Colors.black.withOpacity(0.6),
          backgroundColor: Colors.yellow.shade300);
    } else {
      final registerState2 = await registerController.registerVerify();

      if (registerState2.isEmpty) {
        Navigator.of(context).pushReplacement(
          VerticalPageTransition(
            page: VerificationSuccessPage(),
          ),
        );
      } else {
        showSnackBar(
            context: context,
            message: registerState2.toString(),
            backgroundColor: Colors.red.shade300);
      }
    }
  }

  Future<void> resendCode() async {
    final registerState = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);

    final registerState2 = await registerController.resendCode();

    if (registerState2.isEmpty) {
      startResendTimer();
    } else {
      showSnackBar(
          context: context,
          message: registerState2.toString(),
          backgroundColor: Colors.red.shade300);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final registerState = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);
    final OtpFieldController otpController = OtpFieldController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        border: Border.all(width: 0, color: Colors.transparent),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: CupertinoButton(
          child: Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          padding: EdgeInsets.all(0),
        ),
        trailing: CupertinoButton(
          child: Icon(
            Icons.headset_mic_rounded,
            size: 24,
          ),
          onPressed: () {},
          padding: EdgeInsets.all(0),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.10,
                ),
                Center(
                  child: Lottie.asset(
                    'assets/lotties/verification_sent_2.json',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.004,
                ),
                Text(
                  'Verification',
                  style: GoogleFonts.plusJakartaSans(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: 300,
                  child: RichText(
                    text: TextSpan(
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      children: [
                        TextSpan(
                            text:
                                'Masukkan kode verifikasi yang telah kami kirim ke '),
                        TextSpan(
                          text: '${registerState.userId}',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  width: screenWidth * 0.75,
                  child: Column(
                    children: [
                      Container(
                        width: screenWidth * 0.75,
                        child: OTPTextField(
                          onChanged: (value) {
                            registerController.setRegistrationCode(value);
                          },
                          keyboardType: TextInputType.text,
                          otpFieldStyle: OtpFieldStyle(),
                          fieldWidth: 40,
                          fieldStyle: FieldStyle.box,
                          length: 6,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: screenWidth * 0.75,
                        child: CupertinoButton.filled(
                            child: Text(
                              'Masukkan Kode',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ),
                            onPressed: insertCode),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          children: [
                            TextSpan(text: 'Tidak mendapatkan kode anda? '),
                            TextSpan(
                              text: ' Kirim ulang',
                              style: TextStyle(
                                color: isResent ? Colors.grey : Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  if (!isResent) {
                                    resendCode();
                                  }
                                },
                            ),
                            TextSpan(
                              text: isResent ? ' ($timerText)' : '',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
