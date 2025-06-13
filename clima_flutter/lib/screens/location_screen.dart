import 'package:clima_flutter/screens/city_screen.dart';
import 'package:clima_flutter/services/weather.dart';
import 'package:clima_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;
  LocationScreen(this.locationWeather);
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String cityName;
  late int temperature;

  late String messageWeather;
  late String iconWeather;

  WeatherModel weatherModel = WeatherModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weather) {
    setState(() {
      print('atribundo dados ou atualizando');

      if (weather != null &&
          weather['main'] != null &&
          weather['main']['temp'] != null &&
          weather['weather'] != null &&
          weather['weather'][0] != null &&
          weather['weather'][0]['id'] != null &&
          weather['name'] != null) {
        print(weather['name']);
        double tempDouble = weather['main']['temp'];
        temperature = tempDouble.toInt();
        var condition = weather['weather'][0]['id'];
        cityName = weather['name'];
        messageWeather = weatherModel.getMessage(temperature);
        iconWeather = weatherModel.getWeatherIcon(condition);
      } else {
        temperature = 0;
        cityName = 'Desconhecido';
        messageWeather = 'Não foi possível obter o clima';
        iconWeather = '❌';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.8),
              BlendMode.dstATop,
            ),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      print('Iniciando atualizacao');
                      var weatherData = await weatherModel.getLocationWeather();

                      updateUI(weatherData);

                      print(weatherData);
                    },
                    child: Icon(Icons.near_me, size: 50.0),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CityScreen()),
                      );
                    },
                    child: Icon(Icons.location_city, size: 50.0),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(temperature.toString(), style: kTempTextStyle),
                    Text(iconWeather, style: kConditionTextStyle),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$messageWeather in $cityName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
