import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

class CarryFeature extends StatefulWidget {
  const CarryFeature({super.key});

  @override
  State<CarryFeature> createState() => _CarryFeatureState();
}

class _CarryFeatureState extends State<CarryFeature> {
  // ignore: unused_field
  TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = '12234';
  // ignore: unused_field
  List<dynamic> _placesList = [];

  Location _locationController = Location();

  static const LatLng _pGooglePlex = LatLng(-6.200000, 106.816666);
  static const LatLng _pApplePark = LatLng(-6.1991814, 106.8145524);
  LatLng? _currentP = null;

  @override
  void initState() {
    super.initState();
    getLocationUpdates();

    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    // ignore: unnecessary_null_comparison
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggestion(_controller.text);
  }

  void getSuggestion(String input) async {
    String PLACES_API_KEY = "AIzaSyCe0U04_t-ph4Jtg98crIQjqt9kB7U2QP0";
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$PLACES_API_KEY&session_token=$_sessionToken';

    var response = await http.get(Uri.parse(request));

    print(response.body.toString());

    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Pilih Lokasi',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Masukkan Lokasi Anda',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _pGooglePlex, zoom: 15),
              markers: {
                Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pGooglePlex,
                ),
                Marker(
                  markerId: MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _pApplePark,
                ),
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.hasPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationController.onLocationChanged
        .listen((LocationData currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        setState(() {
          _currentP =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          print(_currentP);
        });
      }
    });
  }
}
