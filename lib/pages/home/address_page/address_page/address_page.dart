import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/pages/home/address_page/add_address/add_address.dart';
import 'package:blueray_test_project/pages/home/address_page/edit_address/edit_address.dart';
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

class AddressPage extends ConsumerStatefulWidget {
  const AddressPage({super.key});

  @override
  ConsumerState<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends ConsumerState<AddressPage> {
  List<bool> showDetails = [];
  bool showPrimaryDetail = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    final customerList = ref.watch(customerAddressProvider);
    final primaryAddress = ref.watch(customerAddressProvider2);
    final customerAddressController = ref.read(addressProvider.notifier);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Address List',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Palette.mainBlueColor),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: screenWidth,
            child: CupertinoButton.filled(
              child: Text('Add Address'),
              onPressed: () {
                Navigator.of(context)
                    .push(HorizontalPageTransition(page: AddressForm()));
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          primaryAddress.when(
              data: (text) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(1),
                        border: Border.all(),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    text.addressLabel.toString() +
                                        '\n' +
                                        text.phoneNumber,
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
                                                    BorderRadius.circular(100)),
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
                                                  onPressed: () {},
                                                  child: Text('Set to default'),
                                                ),
                                              ),
                                            PopupMenuItem(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).push(
                                                      HorizontalPageTransition(
                                                          page: EditAddressForm(
                                                    address: text,
                                                  )));
                                                },
                                                child: Text('Edit address'),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              child: TextButton(
                                                onPressed: () {
                                                  ref
                                                      .read(addressProvider
                                                          .notifier)
                                                      .deleteAddress(
                                                          text.addressId, ref);
                                                  FocusScope.of(context)
                                                      .unfocus();
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
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Address',
                                      style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.6)),
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
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Postal Code',
                                        style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Colors.black.withOpacity(0.6)),
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
                          TextButton(
                            onPressed: () {
                              setState(() {
                                showPrimaryDetail = !showPrimaryDetail;
                              });
                            },
                            child: Text(
                              showPrimaryDetail
                                  ? 'Hide Details'
                                  : 'Show Details',
                              style: GoogleFonts.plusJakartaSans(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          // Details Container
                          Visibility(
                            visible: showPrimaryDetail,
                            child: Container(
                              width: screenWidth * 0.8,
                              padding: EdgeInsets.all(16),
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Province",
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          text.provinceName,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Sub District",
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          text.subDistrictName.toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Name",
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          text.name.toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Phone",
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          text.phoneNumber.toString(),
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Note",
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          width: 120,
                                          child: Text(
                                            textAlign: TextAlign.end,
                                            text.note.toString(),
                                            style: GoogleFonts.plusJakartaSans(
                                              color: Colors.black87,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Container(
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Text('Open Details'),
                          //       CupertinoButton(
                          //           child: Icon(Icons.arrow_right_sharp),
                          //           onPressed: () {})
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) => Container(),
              loading: () => Container()),
          Divider(),
          Expanded(
              // height: showPrimaryDetail
              //     ? MediaQuery.sizeOf(context).height * 0.220
              //     : MediaQuery.sizeOf(context).height * 0.42,
              child: customerList.when(
            data: (data) {
              if (showDetails.length != data.length) {
                showDetails = List.generate(
                  data.length,
                  (index) =>
                      index < showDetails.length ? showDetails[index] : false,
                );
              }
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final text = data[index];
                  if (text.isPrimary! == true) {
                    return Container();
                  }
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    margin: EdgeInsets.symmetric(vertical: 12),
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
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  text.addressLabel.toString() +
                                      '\n' +
                                      text.phoneNumber,
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
                                                  BorderRadius.circular(100)),
                                          child: Text(
                                            'Default',
                                            style: GoogleFonts.plusJakartaSans(
                                                color: Colors.white),
                                          ),
                                        )
                                      : Container(),
                                  PopupMenuButton(
                                    icon: Icon(Icons.menu_rounded),
                                    onSelected: (value) {
                                      if (value == 'set_default') {
                                        customerAddressController.setAsPrimary(
                                            text.addressId, ref);
                                      } else if (value == 'edit') {
                                        Navigator.of(context).push(
                                            HorizontalPageTransition(
                                                page: EditAddressForm(
                                                    address: text)));
                                      } else if (value == 'delete') {
                                        ref
                                            .read(addressProvider.notifier)
                                            .deleteAddress(text.addressId, ref);
                                        FocusScope.of(context).unfocus();
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      if (text.isPrimary! == false)
                                        PopupMenuItem(
                                          value: 'set_default',
                                          child: Text(
                                            'Set to Default',
                                            style: TextStyle(
                                                color: Palette.mainBlueColor),
                                          ),
                                        ),
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Text(
                                          'Edit Address',
                                          style: TextStyle(
                                              color: Palette.mainBlueColor),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Text(
                                          'Delete Address',
                                          style: TextStyle(
                                              color: Palette.mainBlueColor),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Address',
                                    style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.6)),
                                  ),
                                  Container(
                                      width: screenWidth * 0.3,
                                      child: Text(
                                        text.address,
                                        style: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      )),
                                ],
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Postal Code',
                                      style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black.withOpacity(0.6)),
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

                        // Toggle Button
                        TextButton(
                          onPressed: () {
                            setState(() {
                              showDetails[index] = !showDetails[index];
                            });
                          },
                          child: Text(
                            showDetails[index]
                                ? 'Hide Details'
                                : 'Show Details',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        // Details Container
                        Visibility(
                          visible: showDetails[index],
                          child: Container(
                            width: screenWidth * 0.8,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Province",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        text.provinceName,
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sub District",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        text.subDistrictName.toString(),
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Name",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        text.name.toString(),
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Phone",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        text.phoneNumber.toString(),
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Note",
                                        style: GoogleFonts.plusJakartaSans(
                                          color: Colors.black87,
                                          fontSize: 14,
                                        ),
                                      ),
                                      Container(
                                        width: 120,
                                        child: Text(
                                          text.note.toString(),
                                          textAlign: TextAlign.end,
                                          style: GoogleFonts.plusJakartaSans(
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          )),
        ],
      ),
    );
  }
}
