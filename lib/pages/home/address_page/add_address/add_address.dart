import 'dart:io';

import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/modules/customer_address/models/create_address.dart';
import 'package:blueray_test_project/pages/home/address_page/add_address/widgets/search_text_field.dart';
import 'package:blueray_test_project/pages/home/address_page/location_picker/location_picker.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddressForm extends ConsumerStatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends ConsumerState<AddressForm> {
  // Controllers for text fields
  final TextEditingController addressController = TextEditingController();
  final TextEditingController addressLabelController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController alamatLengkapController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController latController = TextEditingController();
  final TextEditingController longController = TextEditingController();
  final TextEditingController addressMapController = TextEditingController();
  final TextEditingController npwpController = TextEditingController();

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController subDistrictController = TextEditingController();

  final TextEditingController provinceController2 = TextEditingController();
  final TextEditingController districtController2 = TextEditingController();
  final TextEditingController subDistrictController2 = TextEditingController();

  final TextEditingController locationController = TextEditingController();

  File? npwpImage; // Variable to store the selected NPWP image
  Map<String, dynamic>? selectedLocation;
  final picker = ImagePicker();

  // Method to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // Using gallery for selecting image
    if (pickedFile != null) {
      setState(() {
        npwpImage = File(
            pickedFile.path); // Update the npwpImage with the selected image
      });
    }
  }

  void _pickLocation() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LocationPicker(),
      ),
    );

    if (result != null) {
      setState(() {
        selectedLocation = result as Map<String, dynamic>;
        locationController.text = result['address'];
        latController.text = result['latitude'].toString();
        longController.text = result['longitude'].toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref
            .read(addressProvider.notifier)
            .setProvince(provinceController2.text);
        ref
            .read(addressProvider.notifier)
            .setDistrictId(districtController2.text);
      },
    );
    // Set default values
    addressController.text = "";
    addressLabelController.text = "";
    nameController.text = "";
    phoneNumberController.text = "";
    emailController.text = "";
    alamatLengkapController.text = ""; // Combined
    postalCodeController.text = "";
    latController.text = "";
    longController.text = "";
    addressMapController.text = "";
    npwpController.text = "";
  }

  Widget buildTextField({
    required String title,
    required TextEditingController controller,
    void Function(String)? onSubmitted,
    bool isRequired = true,
    Widget? suffix,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Palette.mainBlueColor),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          CupertinoTextField(
            textInputAction: TextInputAction.next,
            suffix: suffix ?? Container(),
            onSubmitted: onSubmitted ?? (value) {},
            controller: controller,
            keyboardType: keyboardType,
            placeholder: 'Enter $title',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final custAddressState = ref.watch(addressProvider);
    final custAddressController = ref.read(addressProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "Address Form",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Palette.mainBlueColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(title: "Address", controller: addressController),
              buildTextField(
                  title: "Address Label", controller: addressLabelController),
              buildTextField(title: "Name", controller: nameController),
              buildTextField(
                  title: "Phone Number",
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone),
              buildTextField(
                  title: "Email",
                  controller: emailController,
                  isRequired: false,
                  keyboardType: TextInputType.emailAddress),
              // buildTextField(
              //     title: "Alamat Lengkap", controller: alamatLengkapController),
              SearchSelectField(
                title: 'Province',
                controller: provinceController,
                controller2: provinceController2,
              ),
              SizedBox(
                height: 8,
              ),

              SearchSelectField(
                title: 'District',
                controller: districtController,
                controller2: districtController2,
              ),
              SizedBox(
                height: 8,
              ),

              SearchSelectField(
                title: 'Sub District',
                controller: subDistrictController,
                controller2: subDistrictController2,
              ),
              SizedBox(
                height: 8,
              ),
              Consumer(builder: (context, ref, child) {
                final addressState = ref.watch(addressProvider);
                return buildTextField(
                    title: "Postal Code",
                    controller: postalCodeController,
                    suffix: (addressState.isLoading && !addressState.isValid)
                        ? CupertinoActivityIndicator()
                        : (addressState.isValid && !addressState.isLoading)
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                    onSubmitted: (value) async {
                      ref.read(addressProvider.notifier).setPostCode(value);
                      await ref
                          .read(addressProvider.notifier)
                          .validatePostCode();
                    },
                    keyboardType: TextInputType.number);
              }),
              // buildTextField(
              //     title: "Latitude",
              //     controller: latController,
              //     keyboardType: TextInputType.number),
              // buildTextField(
              //     title: "Longitude",
              //     controller: longController,
              //     keyboardType: TextInputType.number),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Address Map",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.mainBlueColor),
                        ),
                        Text(
                          " *",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () => _pickLocation,
                      child: CupertinoTextField(
                        controller: locationController,
                        placeholder: 'Tap to upload Pin your location',
                        readOnly: true,
                        suffix: IconButton(
                          icon: Icon(Icons.map),
                          onPressed: _pickLocation,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              buildTextField(
                  title: "NPWP", controller: npwpController, isRequired: false),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload NPWP Image",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Palette.mainBlueColor),
                    ),
                    SizedBox(height: 8.0),
                    CupertinoTextField(
                      placeholder: 'Tap to upload NPWP image',
                      readOnly: true,
                      suffix: IconButton(
                        icon: Icon(Icons.upload_file),
                        onPressed: _pickImage,
                      ),
                    ),
                    if (npwpImage != null) ...[
                      SizedBox(height: 8.0),
                      Image.file(npwpImage!,
                          height: 100, width: 100, fit: BoxFit.cover),
                      SizedBox(height: 8.0),
                      Text("Image selected",
                          style: TextStyle(color: Colors.green)),
                    ],
                  ],
                ),
              ),
              CupertinoButton.filled(
                  child: Text('Submit'),
                  onPressed: () async {
                    String image = '';
                    try {
                      if (npwpImage != null) {
                        final image2 = await custAddressController.createImage(
                            npwpImage!, ref);

                        if (image2.isNotEmpty) {
                          image = image2;
                          print(image);
                        } else {
                          showSnackBar(
                              context: context,
                              message: 'Image upload unsuccessful!');
                        }
                      }
                      final response =
                          await custAddressController.createAddress(
                              CreateAddress(
                                  email: emailController.text,
                                  npwp: npwpController.text,
                                  npwpFile: image,
                                  address: addressController.text,
                                  addressLabel: addressLabelController.text,
                                  name: nameController.text,
                                  phoneNumber: phoneNumberController.text,
                                  postalCode: postalCodeController.text,
                                  lat: double.parse(latController.text),
                                  long: double.parse(longController.text),
                                  addressMap: locationController.text,
                                  provinceId:
                                      int.parse(provinceController2.text),
                                  districtId:
                                      int.parse(districtController2.text),
                                  subDistrictId:
                                      int.parse(subDistrictController2.text)),
                              ref);
                      if (response == true) {
                        showSnackBar(
                            context: context, message: 'Create successful!');

                        Navigator.of(context).pop();
                      } else {
                        showSnackBar(
                            context: context, message: 'Create unsuccesful!');
                      }
                    } catch (e) {
                      showSnackBar(
                          context: context,
                          message: 'Create unsuccesful!',
                          backgroundColor: Palette.snackBarErrorColor);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
