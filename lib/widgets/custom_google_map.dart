import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:myapp/models/place_model.dart';
import 'package:myapp/utils/location_service.dart';
import 'dart:ui' as ui;

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPostion;

  late LocationService locationService;
  GoogleMapController? googleMapController;
  late Location location;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};

  @override
  void initState() {
    initialCameraPostion = const CameraPosition(
        zoom: 17, target: LatLng(31.187084851056554, 29.928110526889437));
    locationService = LocationService();
    location == Location();
    updateMyLocation();
    initPolylines();
    initPolygons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      polylines: polylines,
      polygons: polygons,
      markers: markers,
      zoomControlsEnabled: false,
      initialCameraPosition: initialCameraPostion,
      onMapCreated: (controller) {
        googleMapController = controller;
        initMapStyle();
        initMarkers();
      },
    );
  }

  void initPolylines() {
    Polyline polyline = Polyline(
        polylineId: PolylineId('1'),
        patterns: [PatternItem.dot],
        startCap: Cap.roundCap,
        points: [
          const LatLng(26.562147725643722, 31.688587154010122),
          const LatLng(26.565775256300356, 31.696077942887943),
          const LatLng(26.560978169446546, 31.698249828409285),
        ],
        color: Colors.red,
        width: 5);
    polylines.add(polyline);
    setState(() {});
  }

  void initMapStyle() async {
    var customMapStyle = await DefaultAssetBundle.of(context)
        .loadString('assets/map_styles/custom_map_style.json');

    googleMapController!.setMapStyle(customMapStyle);
  }

  void updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    var hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      locationService.getRealTimeLocationData((locationData) {
        setMyLocationMarker(locationData);
        setMyCameraPosition(locationData);
      });
    } else {}
  }

  void setMyCameraPosition(LocationData locationData) {
    var camerPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  void setMyLocationMarker(LocationData locationData) {
    var myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!));

    markers.add(myLocationMarker);
    setState(() {});
  }

  void initMarkers() async {
    // var customMarkerIcon = await BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(), 'assets/images/marker.png');
    places.map((place) {
      markers.add(Marker(
        // icon: customMarkerIcon,
        infoWindow: InfoWindow(title: place.name),
        markerId: MarkerId(place.id.toString()),
        position: LatLng(place.latLng.latitude, place.latLng.longitude),
      ));
    });
    setState(() {});
  }

  void initPolygons() {
    Polygon polygon = Polygon(
        polygonId: PolygonId('1'),
        points: [
          const LatLng(26.562147725643722, 31.688587154010122),
          const LatLng(26.565775256300356, 31.696077942887943),
          const LatLng(26.560978169446546, 31.698249828409285),
          const LatLng(26.560066303779262, 31.690869850056153),
          const LatLng(26.562147725643722, 31.688587154010122),
        ],
        fillColor: Colors.green.withOpacity(0.3),
        strokeColor: Colors.red,
        strokeWidth: 0);

    polygons.add(polygon);
    setState(() {});
  }

  void getLoctionData() async {
    location.changeSettings(
      distanceFilter: 2,
    );
    location.onLocationChanged.listen((locationData) {
      var camerPosition = CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15);
      var myLocationMarker = Marker(
        markerId: const MarkerId('my_location_marker'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
      );
      markers.add(
        myLocationMarker,
      );
      setState(() {});

      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
    });
  }
}
