import 'package:blueray_test_project/pages/register/mini/register.dart';
import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:blueray_test_project/ui/widgets/outlined_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
        text: 'Register',
        icon: Icons.arrow_forward_ios,
        onPressed: () {
          Navigator.of(context)
              .push(HorizontalPageTransition(page: RegisterPage()));
        });
  }
}
