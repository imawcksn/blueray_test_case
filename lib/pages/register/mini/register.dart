import 'package:blueray_test_project/controllers/register_controller.dart';
import 'package:blueray_test_project/pages/register/mini/widgets/user_id_text_field.dart';
import 'package:blueray_test_project/pages/register/verification/register_verification.dart';
import 'package:blueray_test_project/pages/register/widgets/login_button.dart';

import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:blueray_test_project/ui/widgets/cupertino_snack_bar.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final registerState = ref.watch(registerProvider);
    final registerController = ref.read(registerProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: true, // Resizes when the keyboard appears
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
                    'assets/lotties/register.json',
                    width: 250,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.004,
                ),
                Text(
                  'Register',
                  style: GoogleFonts.plusJakartaSans(
                      textStyle:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  width: 300,
                  child: Text(
                    'Silahkan isi data dengan benar untuk membuat akun Blueray Cargo',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
                          width: screenWidth * 0.75, child: UserIdTextField()),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: screenWidth * 0.75,
                        child: CupertinoButton.filled(
                          child: Text(
                            'Register',
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w500)),
                          ),
                          onPressed: () async {
                            if (registerState.userId.isEmpty) {
                              showSnackBar(
                                  context: context,
                                  message: 'Field is empty!',
                                  textColor: Colors.white,
                                  backgroundColor: Colors.orange);
                            } else {
                              final registerState2 =
                                  await registerController.registerMini();

                              // final registerState2 = ref.watch(registerProvider);
                              // print('State:' + registerState.error.toString());
                              if (registerState2.isEmpty) {
                                Navigator.of(context).pushReplacement(
                                  HorizontalPageTransition(
                                    page: RegisterVerificationPage(),
                                  ),
                                );
                              } else {
                                // Show error message in a snack bar
                                showCupertinoSnackBar(
                                  context: context,
                                  message: registerState2.toString(),
                                );
                              }
                            }
                          },
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
                      const LoginButton()
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
