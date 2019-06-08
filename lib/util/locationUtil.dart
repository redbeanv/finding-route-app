import 'dart:async';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

abstract class LocationUtilListener {
  onLocationChange(Map<String, double> location);
}

class LocationUtil {
  Location _location = new Location();
  String error;
  // bool _permission = false;

  StreamSubscription<Map<String, double>> _locationSubscription;

  // listener
  LocationUtilListener listener;
  LocationUtil(this.listener);

  void init() {
    getLocationState();

    _locationSubscription =
      _location.onLocationChanged().listen((Map<String,double> result) {
        listener.onLocationChange(result);
      });
  }

  getLocationState() async {
    Map<String, double> location;

    try {
      // _permission = await _location.hasPermission();
      location = await _location.getLocation();
      print("My location: $location");
      error = null;
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        error = 'Permission denied';
      } else if (e.code == 'PERMISSION_DENIED_NEVER_ASK') {
        error = 'Permission denied - please ask the user to enable it from the app settings';
      }
      location = null;
    }
    listener.onLocationChange(location);
  }
}