import 'dart:convert';

import 'package:clima_flutter/screens/location_screen.dart';
import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getLocationData() async {
    WeatherModel location = WeatherModel();
    Map<String, dynamic> locationData = await location.getLocationWeather();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(locationData)),
    );
  }

  @override
  initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.white, size: 60.0)),
    );
  }
}
// double temperature = data['main']['temp'];
// int condition = data['weather'][0]['id'];
// String cityName = data['name'];