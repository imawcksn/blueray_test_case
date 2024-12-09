import 'dart:io';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/modules/authentication/service.dart';
import 'package:blueray_test_project/pages/register/mini/register.dart';
import 'package:blueray_test_project/pages/starting/starting.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().loadEnvironmentVariables();
  // final expiryDateStr = await AuthService().getAuthTokenExpiryDate();
  HttpOverrides.global = MyHttpOverrides();

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(child: const MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        // Wrap the entire app with CupertinoTheme
        return CupertinoTheme(
          data: CupertinoThemeData(
            primaryColor: Palette.mainBlueColor, // Active elements color
            barBackgroundColor: Colors.grey[200], // Background of bars
            textTheme: CupertinoTextThemeData(
              textStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          child: child!,
        );
      },
      theme: ThemeData(
          primaryColor: Palette.mainBlueColor,
          colorScheme: ColorScheme.fromSeed(
            primary: Palette.mainBlueColor,
            seedColor: Palette.mainBlueColor,
            // ···
          ),
          buttonTheme: ButtonThemeData(buttonColor: Palette.mainBlueColor)),
      // theme: CupertinoThemeData(
      //     primaryColor: Palette.mainBlueColor,
      //     scaffoldBackgroundColor: Colors.white),

      home: StartingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
