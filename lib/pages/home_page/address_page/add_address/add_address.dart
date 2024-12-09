import 'package:flutter/material.dart';

class AddressForm extends StatefulWidget {
  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
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

  @override
  void initState() {
    super.initState();

    // Set default values
    addressController.text = "";
    addressLabelController.text = "";
    nameController.text = "";
    phoneNumberController.text = "";
    emailController.text = "servantsofallah.tawheed@gmail.com";
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
    bool isRequired = true,
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
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (isRequired)
                Text(
                  " *",
                  style: TextStyle(color: Colors.red),
                ),
            ],
          ),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter $title",
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Address Form"),
        backgroundColor: Colors.white,
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
              buildTextField(
                  title: "Alamat Lengkap", controller: alamatLengkapController),
              buildTextField(
                  title: "Postal Code",
                  controller: postalCodeController,
                  keyboardType: TextInputType.number),
              buildTextField(
                  title: "Latitude",
                  controller: latController,
                  keyboardType: TextInputType.number),
              buildTextField(
                  title: "Longitude",
                  controller: longController,
                  keyboardType: TextInputType.number),
              buildTextField(
                  title: "Address Map", controller: addressMapController),
              buildTextField(
                  title: "NPWP", controller: npwpController, isRequired: false),
            ],
          ),
        ),
      ),
    );
  }
}
