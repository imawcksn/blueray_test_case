import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/pages/home_page/address_page/add_address/add_address.dart';
import 'package:blueray_test_project/ui/page_transitions/horizontal_page_transition.dart.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

List<String> list = [
  'Aku',
  'AKu',
  'AKAA',
  'sadsa',
  'sadsadsadad',
  'assdsadsad'
];

class AddressPage extends ConsumerWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerList = ref.watch(customerAddressProvider);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text('Address List')],
            ),
            Row(
              children: [
                CupertinoButton.filled(
                  child: Text('Add Address'),
                  onPressed: () {
                    Navigator.of(context)
                        .push(HorizontalPageTransition(page: AddressForm()));
                  },
                ),
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context)
                    .size
                    .height, // Ensures it takes up available height
                child: customerList.when(
                  data: (data) => ListView.builder(
                    itemCount: data.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      final text = data[index];
                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                        decoration: BoxDecoration(
                          boxShadow: [
                            const BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(2, 2), // Shadow position
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(1),
                          border: Border.all(),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(text.name + '\n' + text.phoneNumber,
                                      style: GoogleFonts.plusJakartaSans(
                                          color: Palette.mainBlueColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    children: [
                                      text.isPrimary!
                                          ? Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12, vertical: 6),
                                              decoration: BoxDecoration(
                                                  color: Palette.mainBlueColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: Text(
                                                'Default',
                                                style:
                                                    GoogleFonts.plusJakartaSans(
                                                        color: Colors.white),
                                              ),
                                            )
                                          : Container(),
                                      CupertinoButton(
                                        padding: EdgeInsets.all(0),
                                        child: Icon(Icons.menu_rounded),
                                        onPressed: () {
                                          showMenu(
                                            context: context,
                                            position: RelativeRect.fromLTRB(
                                                200,
                                                200,
                                                50,
                                                0), // Adjust the position
                                            items: [
                                              if (text.isPrimary! == false)
                                                PopupMenuItem(
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(
                                                          context); // Close the menu
                                                    },
                                                    child:
                                                        Text('Set to default'),
                                                  ),
                                                ),
                                              PopupMenuItem(
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close the menu
                                                  },
                                                  child: Text('Edit address'),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Close the menu
                                                  },
                                                  child: Text('Delete address'),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Address',
                                        style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                      Container(
                                          width: screenWidth * 0.3,
                                          child: Text(
                                            text.address,
                                            style: GoogleFonts.plusJakartaSans(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black
                                                    .withOpacity(0.6)),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Postal Code',
                                          style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black
                                                  .withOpacity(0.6)),
                                        ),
                                        Container(
                                            child: Text(
                                          text.postalCode,
                                          style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              color: Palette.mainBlueColor),
                                        )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      );
                    },
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => Container(),
                )),
          ],
        ),
      ),
    );
  }
}
