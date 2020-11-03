import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:join_party/events_modules/event_screen_demo.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:join_party/models/events_model.dart';
import 'package:firebase_database/firebase_database.dart' as fbase;

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool isMapCreated = false;
  StreamSubscription _locationSubscription;
  BitmapDescriptor customIcon;
  Set<Marker> _markers = Set<Marker>();
  static bool isTapped = false;
  Event _event;

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<void> _getMarkers() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/marker1.png', 60);
    for (var event in events) {
      final Marker marker = Marker(
          markerId: MarkerId(event.name),
          icon: BitmapDescriptor.fromBytes(markerIcon),
          position: event.position,
          draggable: false,
          onTap: () {
            setState(() {
              isTapped = true;
              _event = event;
            });
          });
      _markers.add(marker);
    }
  }

  void showEventInfo() {}

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(55.747574, 37.640680),
    zoom: 12,
  );

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlatformMap(
          padding: EdgeInsets.only(top: 50, bottom: 40),
          initialCameraPosition: initialLocation,
          mapType: MapType.normal,
          markers: _markers,
          onMapCreated: (PlatformMapController controller) async {
            isMapCreated = true;
            await _getMarkers();
            setState(() {});
          },
          onLongPress: addEventOnMap(),
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
        ),
        isTapped
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 600,
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: EventScreenDemo(
                          event: _event,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.only(
                            left: 24,
                            right: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[400],
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isTapped = false;
                                  });
                                },
                                child: Text(
                                  "Close",
                                  style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Text(
                                _event.date,
                                style: TextStyle(
                                  color: eventColors[_event.colorScheme],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}

//padding: EdgeInsets.only(top: 60, bottom: 50),
