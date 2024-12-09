import 'package:blueray_test_project/pages/register/mini/register.dart';
import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final void Function() onPressed;
  const CustomOutlinedButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.withOpacity(0.7),
          ),
          borderRadius: BorderRadius.circular(8)),
      width: screenWidth * 0.75,
      child: CupertinoButton(
          child: text.toLowerCase() == 'register'
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      icon,
                      size: 16,
                    )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 16,
                    ),
                    SizedBox(width: 12),
                    Text(
                      text,
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
          onPressed: onPressed),
    );
  }
}
