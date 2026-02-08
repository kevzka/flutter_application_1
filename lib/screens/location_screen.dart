import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/providers/location_listener.dart';
import 'package:free_map/free_map.dart';
import 'package:flutter_application_1/providers/write_location.dart';

class locationScreen extends StatefulWidget {
  const locationScreen({super.key});

  @override
  State<locationScreen> createState() => _locationScreenState();
}

class _locationScreenState extends State<locationScreen> {
  StreamSubscription? _locationSubscription;
  LatLng? _currentPos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _initLocationStream();
            },
            child: Text("write Location"),
          ),
          ElevatedButton(
            onPressed: () {
              readLocation("Dave");
            },
            child: Text("read Location"),
          ),
        ],
      ),
    );
  }

  void _initLocationStream() async {
    try {
      final locationStream = await getLocationStream();
      _locationSubscription = locationStream.listen((locationData) async {
        if (mounted) {
          setState(() {
            _currentPos = LatLng(
              locationData.latitude!,
              locationData.longitude!,
            );
          });
          writeLocation(
            "kevin",
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          );
          print(
            'Location: ${locationData.latitude}, ${locationData.longitude}',
          );
        }
      });
    } catch (e) {
      print('Error getting location stream: $e');
    }
  }
}
