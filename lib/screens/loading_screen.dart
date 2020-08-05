import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import '../services/location.dart';
import '../services/networking.dart';
import '../services/networking.dart';

const kApiKey = '9d6be499b4af280a1a3f0e666ca4d1d4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    String url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$kApiKey';
    NetworkHelper networkData = NetworkHelper(url: url);
    print(url);
    var weatherData = networkData.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoadingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
