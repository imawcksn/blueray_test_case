import 'dart:io';

import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/modules/customer_address/models/address_model.dart';
import 'package:blueray_test_project/modules/customer_address/models/create_address.dart';
import 'package:blueray_test_project/pages/home/address_page/add_address/widgets/search_text_field.dart';
import 'package:blueray_test_project/pages/home/address_page/location_picker/location_picker.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:blueray_test_project/ui/widgets/material_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class EditAddressForm extends ConsumerStatefulWidget {
  final Address address;

  EditAddressForm({super.key, required this.address});
  @override
  _EditAddressFormState createState() => _EditAddressFormState();
}

class _EditAddressFormState extends ConsumerState<EditAddressForm> {

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

  File? npwpImage; 
  Map<String, dynamic>? selectedLocation;
  final picker = ImagePicker();


  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); 
    if (pickedFile != null) {
      setState(() {
        npwpImage = File(
            pickedFile.path); 
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
 
    addressController.text = widget.address.address;
    addressLabelController.text = widget.address.addressLabel ?? '';
    nameController.text = widget.address.name;
    phoneNumberController.text = widget.address.phoneNumber;
    emailController.text = widget.address.email ?? '';
    locationController.text = widget.address.addressMap ?? ''; // Combined
    postalCodeController.text = widget.address.postalCode;
    latController.text = widget.address.lat.toString();
    longController.text = widget.address.long.toString();
    addressMapController.text = widget.address.addressMap ?? '';
    npwpController.text = widget.address.npwp ?? '';
    provinceController.text = widget.address.provinceName;
    provinceController2.text = widget.address.provinceId.toString();
    districtController.text = widget.address.districtName;
    districtController2.text = widget.address.districtId.toString();
    subDistrictController.text = widget.address.subDistrictName;
    subDistrictController2.text = widget.address.subDistrictId.toString();
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
        backgroundColor: Palette.mainBlueColor,
        title: Text(
          "Address Form",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                  isRequired: true,
                  keyboardType: TextInputType.phone),
              buildTextField(
                  title: "Email",
                  controller: emailController,
                  isRequired: true,
                  keyboardType: TextInputType.emailAddress),
              // buildTextField(
              //     title: "Alamat Lengkap", controller: alamatLengkapController),
              SearchSelectField(
                title: 'Province',
                controller: provinceController,
                controller2: provinceController2,
              ),
              SearchSelectField(
                title: 'District',
                controller: districtController,
                controller2: districtController2,
              ),
              SearchSelectField(
                title: 'Sub District',
                controller: subDistrictController,
                controller2: subDistrictController2,
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
                        placeholder: locationController.text.isNotEmpty
                            ? 'Tap to upload Pin your location'
                            : locationController.text,
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
                      controller: npwpController,
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
                    if (npwpImage == null &&
                        widget.address.npwpFile!.isNotEmpty) ...[
                      SizedBox(height: 8.0),
                      Image.network(widget.address.npwpFile!,
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
                      final response = await custAddressController.editAddress(
                          CreateAddress(
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
                              provinceId: int.parse(provinceController2.text),
                              districtId: int.parse(districtController2.text),
                              subDistrictId:
                                  int.parse(subDistrictController2.text)),
                          widget.address.addressId,
                          ref);
                      if (response == true) {
                        showSnackBar(
                            context: context, message: 'Edit successful!');

                        Navigator.of(context).pop();
                      } else {
                        showSnackBar(
                            context: context, message: 'Edit unsuccesful!');
                      }
                    } catch (e) {
                      showSnackBar(
                          context: context,
                          message: 'Edit unsuccesful!',
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
