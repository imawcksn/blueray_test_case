import 'package:blueray_test_project/controllers/login_controller.dart';
import 'package:blueray_test_project/pages/home/main_page/main_page.dart';
import 'package:blueray_test_project/pages/starting/widgets/password_textfield.dart';
import 'package:blueray_test_project/pages/starting/widgets/register_button.dart';
import 'package:blueray_test_project/pages/starting/widgets/user_id_textfield.dart';
import 'package:blueray_test_project/ui/page_transitions/vertical_page_transition.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class StartingPage extends ConsumerWidget {
  const StartingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final loginController = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    Future<void> login() async {
      if (loginState.userId.isEmpty && loginState.password.isEmpty) {
        showSnackBar(
          context: context,
          message: 'Credentials is empty!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }
      if (loginState.userId.isEmpty) {
        showSnackBar(
          context: context,
          message: 'Email / Phone number is empty!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }
      if (loginState.password.isEmpty) {
        showSnackBar(
          context: context,
          message: 'Password field is empty!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }

      if (loginState.password.length <= 8) {
        showSnackBar(
          context: context,
          message: 'Password needs to be more than 8 characters!',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }

      final passwordRegExp =
          RegExp(r'(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])');
      if (!loginState.password.contains(passwordRegExp)) {
        showSnackBar(
          context: context,
          message:
              'Password must contain at least one uppercase letter, one number, and one symbol.',
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
      }
      final login = await loginController.login();

      if (login.isEmpty) {
        Navigator.of(context).pushAndRemoveUntil(
          VerticalPageTransition(page: MainPage()),
          (route) => false,
        );
      } else {
        showSnackBar(
          context: context,
          message: login,
          textColor: Colors.white,
          backgroundColor: Palette.snackBarWarningColor,
        );
        return;
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
            size: 32,
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
                    'assets/lotties/squishy_ball.json',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.004,
                ),
                Text(
                  'Login',
                  style: GoogleFonts.plusJakartaSans(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'Masukkan kredensial anda untuk login',
                  style: GoogleFonts.plusJakartaSans(
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: screenHeight * 0.06,
                ),
                Container(
                  width: screenWidth * 0.75,
                  child: Column(
                    children: [
                      Container(
                          width: screenWidth * 0.75, child: UserIdTextField()),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                          width: screenWidth * 0.75,
                          child: PasswordTextField()),
                      SizedBox(height: 8),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text('Forgot Password?',
                      //         style: GoogleFonts.plusJakartaSans(
                      //             textStyle: TextStyle(
                      //                 fontSize: 12,
                      //                 color: Palette.mainBlueColor))),
                      //   ],
                      // ),
                      SizedBox(height: 16),
                      Container(
                        width: screenWidth * 0.75,
                        child: CupertinoButton(
                          color: Palette.mainBlueColor,
                          child: loginState.isLoading
                              ? CupertinoActivityIndicator()
                              : Text(
                                  'Login',
                                  style: GoogleFonts.plusJakartaSans(
                                      textStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500)),
                                ),
                          onPressed: login,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'or',
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.withOpacity(0.4),
                              )),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const RegisterButton()
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
