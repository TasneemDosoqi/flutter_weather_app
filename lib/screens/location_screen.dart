import 'package:clima/Modules/Circular_indicator.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen(this.locationWeather);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  var temperature;
  int intTemperature;
  String condition;
  var codeCondition;
  String cityName;
  int humidity;
  int clouds;
  double wind;
  int pressure;
  double feels_like;
  var temp_min;
  var temp_max;
  int visibility;
  double doubleVisibility;

  @override
  void initState() {
    super.initState();
    updateLocationScreen(widget.locationWeather);
  }

  void updateLocationScreen(dynamic weatherData) {
    setState(() {
      // If weather data is null for any issues, the data will be zeros and null
      if (weatherData == null) {
        temperature = 0;
        intTemperature = temperature.toInt();
        condition = '️Please check location permissions and try again ‼️';
        codeCondition = -1;
        cityName = ' ';
        humidity = 0;
        clouds = 0;
        wind = 0;
        pressure = 0;
        feels_like = 0;
        temp_min = 0;
        temp_max = 0;
        visibility = 0;
        doubleVisibility = (visibility / 100).roundToDouble();
        return;
      }

      //Getting weather data from JASON
      temperature = weatherData['main']['temp'];
      intTemperature = temperature.toInt();
      condition = weatherData['weather'][0]['main'];
      codeCondition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      humidity = weatherData['main']['humidity'];
      clouds = weatherData['clouds']['all'];
      wind = weatherData['wind']['speed'];
      pressure = weatherData['main']['pressure'];
      feels_like = weatherData['main']['feels_like'];
      temp_min = weatherData['main']['temp_min'];
      temp_max = weatherData['main']['temp_max'];
      visibility = weatherData['visibility'];
      doubleVisibility = (visibility / 100).roundToDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: blue,
        ),
        child: Stack(
          children: [
            Container(
              color: light,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children: [
                        CircularIndicator(
                          indicatorColor: cyan,
                          percent: humidity / 100,
                          amount: humidity.toString(),
                          mark: "%",
                          title: "Humidity",
                          icon: "assets/hygrometer.png",
                        ),
                        CircularIndicator(
                          indicatorColor: blue,
                          percent: clouds / 100,
                          amount: clouds.toString(),
                          mark: "%",
                          title: "Clouds",
                          icon: "assets/cloud.png",
                        ),
                        CircularIndicator(
                          indicatorColor: green,
                          percent: wind / 100,
                          amount: wind.toString(),
                          mark: "mph",
                          title: "Wind",
                          icon: "assets/wind.png",
                        ),
                        CircularIndicator(
                          indicatorColor: yellow,
                          percent: .22,
                          amount: 22.toString(),
                          mark: "%",
                          title: "Pressure",
                          icon: "assets/pressure.png",
                        ),
                      ],
                    ),
                  ),
                  weatherDataContainer(),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      weatherModel.getMessage(intTemperature) +
                          " in $cityName !",
                      // textAlign: TextAlign.right,
                      style: kConstTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            waveClipPath(context),
            firstPositionedClip(),
            secondPositionedClip(context),
            SafeArea(
              child: Column(
                children: [
                  //upper bar row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () async {
                          var weatherData =
                              await weatherModel.getLocationWeather();
                          updateLocationScreen(weatherData);
                        },
                        child: Icon(
                          Icons.location_searching,
                          size: 30.0,
                          color: light,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async {
                          var searchedCityName = await Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CityScreen();
                          }));
                          if (searchedCityName != null) {
                            var weatherData = await weatherModel
                                .getCityWeather(searchedCityName);
                            updateLocationScreen(weatherData);
                          }
                        },
                        child: Icon(
                          Icons.search,
                          size: 30.0,
                          color: light,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    cityName,
                    style: kBigTitleTextStyle,
                  ),
                  lineMarks(),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    condition +
                        " " +
                        weatherModel.getWeatherIcon(codeCondition),
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                  Text(
                    '$intTemperature°',
                    style: kBigTitleTextStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //This function retrieve the container contains the minimum and maximum temperatures and more
  Padding weatherDataContainer() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [containerShadow()],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MINIMUM",
                  textAlign: TextAlign.right,
                  style: kConstTextStyle,
                ),
                temperatureRow(
                    temp_min.toInt(), kNumberTextStyle, kNumberTextStyle),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "MAXIMUM",
                  textAlign: TextAlign.right,
                  style: kConstTextStyle,
                ),
                temperatureRow(
                    temp_max.toInt(), kNumberTextStyle, kNumberTextStyle),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FEELS LIKE",
                  textAlign: TextAlign.right,
                  style: kConstTextStyle,
                ),
                temperatureRow(
                    feels_like.toInt(), kNumberTextStyle, kNumberTextStyle),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "VISIBILITY",
                  textAlign: TextAlign.right,
                  style: kConstTextStyle,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      doubleVisibility.toString(),
                      textAlign: TextAlign.right,
                      style: kNumberTextStyle,
                    ),
                    Text(
                      "km",
                      style: kNumberTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //This function retrieve wave clip used https://pub.dev/packages/flutter_custom_clippers
  ClipPath waveClipPath(BuildContext context) {
    return ClipPath(
      clipper: WaveClipperOne(),
      child: Container(
        height: MediaQuery.of(context).size.height / 2,
        color: blue,
      ),
    );
  }

  //This function retrieve second Floating clip
  Positioned secondPositionedClip(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width / 2 + 50,
      top: MediaQuery.of(context).size.height / 3 + 2,
      height: 150,
      width: 300,
      child: Image.asset(
        'assets/path2.png',
      ),
    );
  }

  //This function retrieve first Floating clip
  Positioned firstPositionedClip() {
    return Positioned(
      left: 80,
      top: -20,
      height: 200,
      width: 400,
      child: Image.asset(
        'assets/path1.png',
      ),
    );
  }

  //This function retrieve the temperature sign
  Row temperatureRow(
      var temperature, TextStyle numberStyle, TextStyle temperatureStyle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temperature.toString(),
          textAlign: TextAlign.right,
          style: numberStyle,
        ),
        Text(
          "°",
          style: temperatureStyle,
        )
      ],
    );
  }

  //This function retrieve the three light blue dashes
  Row lineMarks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5,
          width: 60,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 5,
          width: 15,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Container(
          height: 5,
          width: 15,
          decoration: BoxDecoration(
            color: lightBlue,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }
}
