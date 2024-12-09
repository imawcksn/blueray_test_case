import 'package:blueray_test_project/controllers/register_controller.dart';
import 'package:blueray_test_project/pages/register/verification/widgets/password_text_field.dart';
import 'package:blueray_test_project/pages/register/widgets/login_button.dart';
import 'package:blueray_test_project/pages/starting/starting.dart';

import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:blueray_test_project/ui/page_transitions/vertical_page_transition.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class VerificationSuccessPage extends ConsumerWidget {
  const VerificationSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final registerState = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);

    Future<void> insertPassword() async {
      if (registerState.password.isEmpty) {
        showSnackBar(
          context: context,
          message: 'Password field is empty!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }

      if (registerState.password.length <= 8) {
        showSnackBar(
          context: context,
          message: 'Password needs to be more than 8 characters!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }
      if (registerState.password.contains(' ')) {
        showSnackBar(
          context: context,
          message: 'Password cannot contain spaces!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }
      final passwordRegExp =
          RegExp(r'(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])');
      if (!registerState.password.contains(passwordRegExp)) {
        showSnackBar(
          context: context,
          message:
              'Password must contain at least one uppercase letter, one number, and one symbol.',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }

      final response = await registerController.registerPassword();

      if (response.isEmpty) {
        Navigator.of(context).pushAndRemoveUntil(
          VerticalPageTransition(page: StartingPage()),
          (route) => false,
        );
      } else {
        showSnackBar(
          context: context,
          message: response.toString(),
          textColor: Colors.white,
          backgroundColor: Palette.snackBarErrorColor,
        );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true, 
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        border: Border.all(width: 0, color: Colors.transparent),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: Row(
          children: [
            Image.asset('assets/images/blue_ray_cargo.png'),
            Text(
              'Blueraycargo.id',
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 12, color: Colors.black),
            ),
          ],
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
                    repeat: false,
                    'assets/lotties/verification_success.json',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.004,
                ),
                Text(
                  'Verifikasi Sukses!',
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
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      children: [
                        TextSpan(
                            text:
                                'Email anda berhasil terverifikasi. Sekarang Anda bisa login dengan email.'),
                        TextSpan(
                          text:
                              '\n\nSilahkan masukkan password yang kamu inginkan.',
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
                  height: screenHeight * 0.06,
                ),
                Container(
                  width: screenWidth * 0.75,
                  child: Column(
                    children: [
                      Container(
                          width: screenWidth * 0.75,
                          child: PasswordTextField()),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Passsword harus terdiri dari setidaknya satu huruf kapital, satu angka, dan satu simbol.',
                        style: GoogleFonts.poppins(
                            fontSize: 9,
                            color: Colors.black.withOpacity(0.5),
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: screenWidth * 0.75,
                        child: CupertinoButton.filled(
                            child: Text(
                              'Terapkan Password',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ),
                            onPressed: insertPassword),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 1,
                      //         color: Colors.grey.withOpacity(0.3),
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.symmetric(horizontal: 8),
                      //       child: Text(
                      //         'or',
                      //         style: GoogleFonts.plusJakartaSans(
                      //             textStyle: TextStyle(
                      //           fontSize: 12,
                      //           color: Colors.grey.withOpacity(0.4),
                      //         )),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: Divider(
                      //         thickness: 1,
                      //         color: Colors.grey.withOpacity(0.3),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      // const LoginButton()
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                // CupertinoButton.filled(
                //   child: Text(
                //     'Register',
                //     style: GoogleFonts.poppins(
                //         textStyle: TextStyle(
                //             fontSize: 12, fontWeight: FontWeight.w500)),
                //   ),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
