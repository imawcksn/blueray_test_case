import 'package:blueray_test_project/controllers/login_controller.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class UserIdTextField extends ConsumerStatefulWidget {
  const UserIdTextField({super.key});

  @override
  ConsumerState<UserIdTextField> createState() => _UserIdTextFieldState();
}

class _UserIdTextFieldState extends ConsumerState<UserIdTextField> {
  bool showClear = false;
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginController = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);
    return CupertinoTextField(
      cursorColor: Palette.mainBlueColor,
      suffix: (loginState.isLoading == true)
          ? Container(
              margin: EdgeInsets.only(right: 10),
              child: CupertinoActivityIndicator())
          : showClear
              ? CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.clear_rounded,
                  ),
                  onPressed: () {
                    controller.clear();
                    loginController.setUserId('');
                    FocusScope.of(context).unfocus();
                    setState(() {
                      showClear = false;
                    });
                  })
              : null,
      onChanged: (value) {
        loginController.setUserId(value);
        if (value.isNotEmpty && showClear != true) {
          setState(() {
            showClear = true;
          });
        } else if (value.isEmpty && showClear != false) {
          setState(() {
            showClear = false;
          });
        }
      },
      onSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
      textInputAction: TextInputAction.next,
      placeholder: 'Email / No. telp',
      controller: controller,
      placeholderStyle: GoogleFonts.poppins(
          textStyle:
              TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.35))),
      style: GoogleFonts.poppins(
          textStyle:
              TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.9))),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(8)),
      clearButtonMode: OverlayVisibilityMode.never,
    );
  }
}
