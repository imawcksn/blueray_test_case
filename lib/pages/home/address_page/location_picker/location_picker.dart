import 'package:blueray_test_project/ui/pallete/pallete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLocationPicker(
        initPosition: LatLong(-6.200000, 106.816666),
        locationButtonBackgroundColor: Palette.mainBlueColor,
        
        initZoom: 11,
        minZoomLevel: 5,
        maxZoomLevel: 16,
        trackMyPosition: true,
        searchBarBackgroundColor: Colors.white,
        selectedLocationButtonTextStyle: const TextStyle(fontSize: 18),
        mapLanguage: 'en',
        onError: (e) => print(e),
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        onPicked: (pickedData) {
          Navigator.pop(context, {
            'latitude': pickedData.latLong.latitude,
            'longitude': pickedData.latLong.longitude,
            'address': pickedData.address,
            'addressData': pickedData.addressData,
          });
        },
        onChanged: (pickedData) {
          print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);
          print(pickedData.addressData);
        },
        showContributorBadgeForOSM: true,
      ),
    );
  }
}
