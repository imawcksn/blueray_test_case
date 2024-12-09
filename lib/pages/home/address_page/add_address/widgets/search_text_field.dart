import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/modules/address/models/search_address.dart';
import 'package:blueray_test_project/pages/home/address_page/select_address/select_address.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchSelectField extends ConsumerStatefulWidget {
  final String title;
  final TextEditingController controller;
  final TextEditingController controller2;

  SearchSelectField({
    required this.title,
    required this.controller,
    required this.controller2,
  });

  @override
  ConsumerState<SearchSelectField> createState() => _SearchSelectFieldState();
}

class _SearchSelectFieldState extends ConsumerState<SearchSelectField> {
  @override
  Widget build(BuildContext context) {
    final selectedProvinceId = ref.watch(addressProvider).provinceId;
    final selectedDistrictId = ref.watch(addressProvider).districtId;
    return Visibility(
      visible:
          (widget.title.toLowerCase() == 'district' && selectedProvinceId == '')
              ? false
              : (widget.title.toLowerCase() == 'sub district' &&
                      selectedDistrictId == '')
                  ? false
                  : true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Palette.mainBlueColor),
              ),
              Text(
                " *",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          GestureDetector(
            onTap: (widget.title.toLowerCase() == 'district' &&
                    selectedProvinceId == '')
                ? () {}
                : (widget.title.toLowerCase() == 'sub district' &&
                        selectedDistrictId == '')
                    ? () {}
                    : () async {
                        // Navigate to SelectAddress page
                        final selectedAddress = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SelectAddress(title: widget.title),
                          ),
                        );

                        // If a selection is made, update the controllers
                        if (selectedAddress != null) {
                          widget.controller.text = selectedAddress['name'];
                          widget.controller2.text =
                              selectedAddress['id'].toString();
                        }
                      },
            child: AbsorbPointer(
              child: CupertinoTextField(
                controller: widget.controller,
                placeholder: 'Select a ${widget.title}',
                suffix: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
