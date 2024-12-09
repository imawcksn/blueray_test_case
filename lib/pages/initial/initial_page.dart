import 'dart:async';

import 'package:blueray_test_project/main.dart';
import 'package:blueray_test_project/modules/authentication/service.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: AuthService().getTestAuthTokenExpiryDate(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("[InitialScreen] Loading token expiry date...");
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final expiryDateStr = snapshot.data;
        print("[InitialScreen] Token expiry date fetched: $expiryDateStr");

        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (expiryDateStr == null) {
            // No token, navigate to login
            print("[InitialScreen] No token found. Navigating to login.");
            Navigator.of(context).pushReplacementNamed('/login');
          } else {
            final expiryDate = DateTime.parse(expiryDateStr);
            final now = DateTime.now().toUtc();

            if (now.isAfter(expiryDate)) {
              // Token expired, navigate to login
              print("[InitialScreen] Token expired. Navigating to login.");
              Navigator.of(context).pushReplacementNamed('/login');
            } else {
              // Token valid, navigate to home
              print("[InitialScreen] Token valid. Navigating to home.");
              Navigator.of(context).pushReplacementNamed('/home');
              AuthTimerService().startTimer(expiryDate); // Start expiry timer
            }
          }
        });

        return Scaffold(body: SizedBox.shrink());
      },
    );
  }
}

class AuthTimerService {
  Timer? _timer;

  void startTimer(DateTime expiryDate) {
    final now = DateTime.now().toUtc();
    final duration = expiryDate.difference(now);

    if (duration.isNegative) {
      print("[AuthTimerService] Token already expired. Navigating to login.");
      _navigateToLogin();
      return;
    }

    print(
        "[AuthTimerService] Token valid. Starting timer for ${duration.inSeconds} seconds.");
    _timer = Timer(duration, () {
      print("[AuthTimerService] Timer completed. Navigating to login.");

      _navigateToLogin();
    });
  }

  void cancelTimer() {
    if (_timer != null) {
      print("[AuthTimerService] Timer canceled.");
    }
    _timer?.cancel();
    _timer = null;
  }

  void _navigateToLogin() {
    print("[AuthTimerService] Navigating to login screen.");
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      '/login',
      (Route<dynamic> route) => false,
    );
    AuthService().clearAll();
    Future.delayed(Duration(milliseconds: 300), () {
      final currentContext = navigatorKey.currentState?.context;

      if (currentContext != null) {
        ScaffoldMessenger.of(currentContext).showSnackBar(
          SnackBar(
            content: Text('Session expired, please login again.'),
            backgroundColor: Palette.snackBarWarningColor,
            duration: Duration(seconds: 3),
          ),
        );
      }
    });
  }
}
