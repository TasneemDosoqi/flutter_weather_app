import 'package:clima/services/weather.dart';
import 'package:clima/utilities/colours.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude;
  double latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  // This function retrieves the weather data from the WeatherModel based on device location
  void getLocationData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //This spin is from https://pub.dev/packages/flutter_spinkit
        child: SpinKitCircle(
          color: blue,
          size: 100,
        ),
      ),
    );
  }
}
