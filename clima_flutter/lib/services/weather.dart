import 'dart:convert';

import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';

const apiKey = 'ca5e7845b225f422f3c9ee9a6dc07913';
const openWeatherWeb = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<Map<String, dynamic>> getLocationWeather() async {
    final Location localPermission = Location();
    await localPermission.getCurrentLocation();

    print('Recebendo dados da api');
    var data = await NetWorkHelper(
      '$openWeatherWeb?lat=${localPermission.latitude}&lon=${localPermission.longitude}&appid=$apiKey&units=metric',
    ).getData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
