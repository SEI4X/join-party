import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isMapCreated = false;
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  PlatformMapController _controller;

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String style) {
    _controller.googleController.setMapStyle(style);
  }

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(55.747574, 37.640680),
    zoom: 12,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/images/myLoc.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          draggable: false,
          icon: BitmapDescriptor.fromBytes(imageData));
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  changeMapMode() {
    getJsonFile("assets/light_map.json").then(setMapStyle);
  }

  addEventOnMap() {}

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isMapCreated) {
      changeMapMode();
    }
    return Stack(
      children: [
        PlatformMap(
          padding: EdgeInsets.only(top: 50, bottom: 42),
          initialCameraPosition: initialLocation,
          mapType: MapType.normal,
          markers: Set.of((marker != null) ? [marker] : []),
          onMapCreated: (PlatformMapController controller) {
            _controller = controller;
            isMapCreated = true;
            changeMapMode();
            setState(() {});
          },
          onLongPress: addEventOnMap(),
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
      ],
    );
  }
}

//padding: EdgeInsets.only(top: 60, bottom: 50),
