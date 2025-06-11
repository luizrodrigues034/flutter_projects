import 'dart:convert';

import 'package:clima_flutter/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  final localPermission = Location();

  getLocate() async {
    await localPermission.getCurrentLocation();
    print(
      'Latitude: ${localPermission.latitude} Longitude: ${localPermission.longitude}',
    );
  }

  Future<http.Response> getTempereture() {
    print(localPermission.latitude);
    // This function can be used to fetch temperature data based on the location.
    return http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${localPermission.latitude}&lon=${localPermission.longitude}&appid=ca5e7845b225f422f3c9ee9a6dc07913',
      ),
    );
  }

  @override
  initState() {
    super.initState();
    getLocate().then((_) {
      getTempereture().then((response) {
        if (response.statusCode == 200) {
          final Map<String, dynamic> decodeResponse = jsonDecode(response.body);
          print(decodeResponse['weather'][0]['id']);
          print(decodeResponse['main']['temp']);
          print(decodeResponse['name']); // Tempo
        } else {
          print('Sucesso na conexao${response.statusCode}');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            print(localPermission.latitude);
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
