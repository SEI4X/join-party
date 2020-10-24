import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart' as lct;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  MapType _currentMapType = MapType.normal;
  GoogleMapController _controller;
  LatLng _currentLocation = LatLng(55.747574, 37.640680);
  lct.Location location;
  BitmapDescriptor icon;

  @override
  void initState() {
    getIcon();
    requestPerms();
    super.initState();
  }

  getLocation() async {
    var currentLocation = await location.getLocation();
    locationUpdate(currentLocation);
  }

  locationUpdate(currentLocation) {
    if (currentLocation = null) {
      setState(() {
        _currentLocation =
            LatLng(currentLocation.latitude, currentLocation.longitude);
        this._controller.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: _currentLocation, zoom: 12.5)));
        _createMarker();
      });
    }
  }

  gpsEnable() async {
    location = lct.Location();
    bool statusResult = await location.requestService();

    if (!statusResult) {
      gpsEnable();
    } else {
      getLocation();
      changedLocation();
    }
  }

  getIcon() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 3.0), "assets/images/myLoc.png");
    setState(() {
      this.icon = icon;
    });
  }

  Set<Marker> _createMarker() {
    var marker = Set<Marker>();

    marker.add(Marker(
        markerId: MarkerId("MarkerCurrent"),
        position: _currentLocation,
        infoWindow: InfoWindow(title: "My position", snippet: ""),
        draggable: true,
        onDragEnd: onDragEnd,
        icon: icon));

    return marker;
  }

  onDragEnd(LatLng position) {
    print("Position: $position");
  }

  requestPerms() async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.locationAlways].request();

    var status = statuses[Permission.locationAlways];
    if (status == PermissionStatus.denied) {
      requestPerms();
    } else {
      gpsEnable();
    }
  }

  _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  changedLocation() {
    location.onLocationChanged.listen((lct.LocationData cLoc) {
      if (cLoc != null) locationUpdate(cLoc);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(top: 60, bottom: 50),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          minMaxZoomPreference: MinMaxZoomPreference(7, 16),
          initialCameraPosition:
              CameraPosition(target: _currentLocation, zoom: 11),
          mapType: _currentMapType,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          markers: _createMarker(),
        ),
      ],
    );
  }
}
