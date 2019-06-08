import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:finding_route/util/locationUtil.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';


class MapUtil extends StatefulWidget {

  @override
  _MapUtilState createState() => _MapUtilState();
}

class _MapUtilState extends State<MapUtil> implements LocationUtilListener{
  
  LocationUtil gpsUtils;

  // google_flutter_map
  GoogleMapController _mapController;
  LatLng _center = new LatLng(0.0, 0.0);
  double _defaultZoom = 16.0;

  // Location _location = new Location();
  String error;

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }


  @override
  void initState() {
    super.initState();
    gpsUtils = new LocationUtil(this);
    gpsUtils.init();
  }
 
@override
  Widget build(BuildContext context) {
    print("MapUtil build");
    print(_center);
    return GoogleMap(
      // onCameraMove: _onCameraMove(_center, 13),
      onMapCreated: _onMapCreated,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: _defaultZoom,
      ),
    );
  }

  @override
  onLocationChange(Map<String, double> currentLocation) {
    print("onLocationChange");
    _center = new LatLng(currentLocation["latitude"], currentLocation["longitude"]);
    _mapController.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(target: _center, zoom: _defaultZoom)));
  }

  
  CameraPosition _onCameraMove(LatLng latlng, double zoom) {
    return CameraPosition(target: latlng, zoom: zoom);
  }

  // cameraUpdate(CameraPosition cameraPosition) {
  //   // print("campera position changed $location");
  // }
}