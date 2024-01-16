import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Location location = Location();
  LocationData? currentLocation;
  LocationData? myLocation;

  late StreamSubscription locationSubscription;

  void listenToLocation(){
    locationSubscription = location.onLocationChanged.listen((locationData) {
      myLocation = locationData;
      setState(() {

      });
      print('myLocaiton $myLocation');
    },);
  }

  @override
  void initState() {
    // listenToLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Current Location- ${currentLocation?.longitude ?? ''} , ${currentLocation?.altitude ?? ''}'),
            Text(
                'My Location- ${myLocation?.longitude ?? ''} , ${myLocation?.altitude ?? ''}'),
            ElevatedButton(
              onPressed: () async {
                currentLocation = await location.getLocation();
                setState(() {});
                print(currentLocation);
                print('Longitude : ${currentLocation?.longitude}');
                print('Latitude : ${currentLocation?.latitude}');
                print('Altitude : ${currentLocation?.altitude}');
              },
              child: const Text('Show Current Location'),
            ),
            ElevatedButton(
              onPressed: () async{
                PermissionStatus status = await location.hasPermission();
                if(status == PermissionStatus.denied || status == PermissionStatus.deniedForever){
                  await location.requestPermission();
                  await location.getLocation();
                }
              },
              child: const Text('Allow permission'),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    locationSubscription.cancel();
    super.dispose();
  }
}
