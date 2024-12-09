import 'package:blueray_test_project/pages/register/mini/register.dart';
import 'package:blueray_test_project/pages/starting/starting.dart';
import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:blueray_test_project/ui/widgets/outlined_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
        text: 'Login',
        icon: Icons.arrow_back_ios,
        onPressed: () {
          Navigator.of(context).pop();
        });
  }
}
