import 'package:blueray_test_project/controllers/address_controller.dart';
import 'package:blueray_test_project/modules/address/models/district.dart';
import 'package:blueray_test_project/modules/address/models/province.dart';
import 'package:blueray_test_project/modules/address/models/search_address.dart';
import 'package:blueray_test_project/modules/address/models/sub_district.dart';
import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectAddress extends ConsumerStatefulWidget {
  final String title;

  SelectAddress({required this.title});

  @override
  ConsumerState<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends ConsumerState<SelectAddress> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    // Update the search query whenever the text input changes
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedProvinceId = ref.watch(addressProvider).provinceId;
    final selectedDistrictId = ref.watch(addressProvider).districtId;

    final getAddress = widget.title.toLowerCase() == 'province'
        ? ref.watch(getAddressProvider)
        : widget.title.toLowerCase() == 'district'
            ? ref.watch(getAddressProvider2)
            : ref.watch(getAddressProvider3);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.mainBlueColor,
        title: Text('Select ${widget.title}'),
      ),
      body: Column(
        children: [
          // Search input field
          Container(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CupertinoTextField(
              controller: _searchController,
              suffix: Container(
                  margin: EdgeInsets.only(right: 16),
                  child: Icon(Icons.search)),
              placeholder: 'Search ${widget.title}',
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
          ),
          Expanded(
            child: getAddress.when(
              data: (data) {
                // Filter the data based on the search query
                List filteredData = data.where((item) {
                  String itemName = '';
                  bool matchesProvince = true;
                  bool matchesDistrict = true;

                  if (item is Province) {
                    itemName = item.provinceName;
                  } else if (item is District) {
                    itemName = item.districtName;
                    if (selectedProvinceId != '') {
                      matchesProvince =
                          item.provinceId.toString() == selectedProvinceId;
                    }
                  } else if (item is SubDistrict) {
                    itemName = item.subDistrictName;
                    if (selectedDistrictId != '') {
                      matchesDistrict =
                          item.districtId.toString() == selectedDistrictId;
                    }
                  }

                  return itemName
                          .toLowerCase()
                          .contains(_searchQuery.toLowerCase()) &&
                      matchesProvince &&
                      matchesDistrict;
                }).toList();

                return ListView.builder(
                  itemCount: filteredData.length,
                  itemBuilder: (context, index) {
                    final sing = filteredData[index];

                    String text = '';
                    int id = 0;
                    if (sing is Province) {
                      text = sing.provinceName;
                      id = sing.provinceId;
                    } else if (sing is District) {
                      text = sing.districtName;
                      id = sing.districtId;
                    } else if (sing is SubDistrict) {
                      text = sing.subDistrictName;
                      id = sing.subDistrictId;
                    }

                    return ListTile(
                      title: Text(
                        text,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Palette.mainBlueColor),
                      ),
                      onTap: () {
                        if (sing is Province) {
                          ref
                              .read(addressProvider.notifier)
                              .setProvince(id.toString());
                        } else if (sing is District) {
                          ref
                              .read(addressProvider.notifier)
                              .setDistrictId(id.toString());
                        }
                        // Return the selected address when tapped
                        Navigator.pop(context, {
                          'name': text,
                          'id': id,
                        });
                      },
                    );
                  },
                );
              },
              error: (error, stackTrace) {
                return Center(child: Text('Failed to load addresses.'));
              },
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}
