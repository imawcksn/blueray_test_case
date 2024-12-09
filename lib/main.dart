import 'dart:async';
import 'dart:io';

import 'package:blueray_test_project/config/config.dart';
import 'package:blueray_test_project/modules/authentication/service.dart';
import 'package:blueray_test_project/pages/home/address_page/address_page/address_page.dart';
import 'package:blueray_test_project/pages/home/main_page/main_page.dart';
import 'package:blueray_test_project/pages/initial/initial_page.dart';
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

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppConfig().loadEnvironmentVariables();
  final expiryDateStr = await AuthService().getTestAuthTokenExpiryDate();
  await AppConfig.initialize();
  HttpOverrides.global = MyHttpOverrides();

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(
              child: MainApp(
            expiryDateStr: expiryDateStr,
          ))));
}

class MainApp extends StatelessWidget {
  final String? expiryDateStr;
  const MainApp({super.key, required this.expiryDateStr});

  @override

  void scheduleExpiryNavigation(BuildContext context, DateTime expiryDate) {
    final now = DateTime.now().toUtc();
    final remainingDuration = expiryDate.difference(now);

    Timer(remainingDuration, () {
      print('session ended');
      navigatorKey.currentState?.pushReplacementNamed('/login');
    });
  }

  Widget build(BuildContext context) {
    print(
        "[MainApp] Starting application. Initial token expiry date: $expiryDateStr");
    return MaterialApp(
      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => InitialScreen(),
        '/home': (context) => MainPage(),
        '/login': (context) => StartingPage(),
        '/address': (context) => AddressPage(),
      },
      initialRoute: '/',

      darkTheme: ThemeData.light(), 
      themeMode: ThemeMode.light, 
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: (context, child) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            primaryColor: Palette.mainBlueColor,
            barBackgroundColor: Colors.grey[200],
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

      debugShowCheckedModeBanner: false,
    );
  }
}
