import 'package:location/location.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final Location location = Location();

Future<Stream<LocationData>> getLocationStream() async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  StreamSubscription<LocationData>? _locationSubscription;

  // serviceEnabled = await location.serviceEnabled();
  // if (!serviceEnabled) {
  //   serviceEnabled = await location.requestService();
  //   if (!serviceEnabled) {
  //     throw Exception('Location service not enabled');
  //   }
  // }

  // permissionGranted = await location.hasPermission();
  // if (permissionGranted == PermissionStatus.denied) {
  //   permissionGranted = await location.requestPermission();
  //   if (permissionGranted != PermissionStatus.granted) {
  //     throw Exception('Location permission not granted');
  //   }
  // }
  _locationSubscription =
        location.onLocationChanged.handleError((dynamic err) {
      if (err is PlatformException) {
      }
      _locationSubscription?.cancel();
        _locationSubscription = null;
    }).listen((currentLocation) {
        print(currentLocation);
    });

  return location.onLocationChanged;
}
