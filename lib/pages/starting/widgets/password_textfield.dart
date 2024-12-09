import 'package:blueray_test_project/controllers/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends ConsumerStatefulWidget {
  const PasswordTextField({super.key});

  @override
  ConsumerState<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends ConsumerState<PasswordTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    final loginController = ref.watch(loginProvider.notifier);

    return CupertinoTextField(
       textInputAction: TextInputAction.next,
      onChanged: (value) {
        loginController.setPassword(value);
      },
      suffix: CupertinoButton(
          padding: EdgeInsets.all(0),
          child:
              Icon(isVisible ? Icons.visibility_rounded : Icons.visibility_off),
          onPressed: () {
            setState(() {
              isVisible = !isVisible;
            });
          }),
      placeholder: 'Password',
      placeholderStyle: GoogleFonts.plusJakartaSans(
          textStyle:
              TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.35))),
      style: GoogleFonts.poppins(
          textStyle:
              TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.9))),
      obscureText: isVisible,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
