import 'package:flutter/material.dart';

void showSnackBar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.black,
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
      .clearSnackBars(); // Clears any existing snack bars
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
