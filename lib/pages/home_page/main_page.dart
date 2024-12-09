import 'package:blueray_test_project/pages/home_page/address_page/address_page.dart';
import 'package:blueray_test_project/pages/home_page/profile/profile_page.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CupertinoNavigationBar(
        border: Border.all(width: 0, color: Colors.transparent),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        leading: Row(
          children: [
            Image.asset('assets/images/blue_ray_cargo.png'),
            Text(
              'Blueraycargo.id',
              style: GoogleFonts.plusJakartaSans(
                  fontSize: 12, color: Colors.black),
            ),
          ],
        ),
        trailing: CupertinoButton(
          child: Icon(
            Icons.headset_mic_rounded,
            size: 32,
          ),
          onPressed: () {},
          padding: EdgeInsets.all(0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Palette.mainBlueColor,
          fixedColor: Palette.mainBlueColor,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hi'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'His'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hi2'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Hei'),
          ]),
      body: AddressPage(),
    );
  }
}
