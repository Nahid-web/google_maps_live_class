import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  Location location = Location();

  Future<void> getCurrentLocation() async {
    LocationData locationData = await location.getLocation();

    // googleMapController.moveCamera(
    //   CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //       target: LatLng(locationData.longitude!, locationData.latitude!),
    //       zoom: 10,
    //     ),
    //   ),
    // );
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          // target: LatLng(locationData.longitude!, locationData.latitude!),
          target: LatLng(24.299716401265165, 89.08014182909942),
          zoom: 17,
        ),
      ),
    );
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(25.70131066749443, 88.6561565897244),
          zoom: 14,
        ),
        onTap: (LatLng position) {
          print('On tap position $position');
        },
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        markers: {
          Marker(
              markerId: MarkerId('nafdfdfa'),
              position: LatLng(25.70131066749443, 88.6561565897244),
              infoWindow: const InfoWindow(
                  title: 'Title here', snippet: 'Description here'),
              draggable: true,
              onTap: () {
                print('On marker tap');
              },
              onDrag: (position) {
                print('On Drag $position');
              },
              onDragStart: (position) {
                print('On drag start $position');
              },
              onDragEnd: (position) {
                print('On Drag end');
              }),
          Marker(
              markerId: MarkerId('nafdfdfa'),
              position: LatLng(25.69957052259349, 88.66302304433535),
              infoWindow: const InfoWindow(
                  title: 'Title here', snippet: 'Description here'),
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
              draggable: true,
              onTap: () {
                print('On marker tap');
              },
              onDrag: (position) {
                print('On Drag $position');
              },
              onDragStart: (position) {
                print('On drag start $position');
              },
              onDragEnd: (position) {
                print('On Drag end');
              }),
        },
        polylines: {
          Polyline(
            polylineId: PolylineId('erihdfha'),
            points: [
              LatLng(25.698642434912788, 88.64761643680205),
              LatLng(25.700846631341243, 88.66092019261075),
              LatLng(25.70691762802831, 88.64808850555656),
            ],
            patterns: [
              PatternItem.dot,
              PatternItem.gap(10),
              PatternItem.dash(2),
              PatternItem.gap(10)
            ],
            width: 10,
            color: Colors.red,
            jointType: JointType.mitered,
            endCap: Cap.roundCap,
            startCap: Cap.buttCap,
          ),
        },
        polygons: {
          Polygon(
            polygonId: PolygonId('fdfdffgdea'),
            fillColor: Colors.orange,
            strokeWidth: 5,
            strokeColor: Colors.red,
            points: [
              LatLng(25.69499075201698, 88.65994926542044),
              LatLng(25.694489832149888, 88.67129534482956),
              LatLng(25.684677662089378, 88.67018356919289),
              LatLng(25.684677662089378, 88.65867421030998),
            ],
          ),
        },
        circles: {
          Circle(
            circleId: CircleId('dfdfd'),
            center: LatLng(25.723478988330005, 88.64817839115858),
            radius: 300,
            fillColor: Colors.red,
            strokeWidth: 5,
          )
        },
      ),
    );
  }
}
