import 'package:flutter/material.dart';
import 'package:google_maps_live_class/home_screen.dart';
import 'package:google_maps_live_class/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen() ,
      // home: LocationScreen(),
    );
  }
}
