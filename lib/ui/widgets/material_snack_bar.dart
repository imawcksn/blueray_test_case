import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.green,
  Color textColor = Colors.white,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: TextStyle(color: textColor),
    ),
    backgroundColor: backgroundColor,
  );

  ScaffoldMessenger.of(context)
      .clearSnackBars(); 
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
