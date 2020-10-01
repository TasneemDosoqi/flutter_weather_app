import 'package:clima/Modules/Circular_indicator.dart';
import 'package:clima/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: blue,
        ),
        //constraints: BoxConstraints.expand(),
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
                          percent: .45,
                          amount: (.45 * 100).round().toString(),
                          mark: "%",
                          title: "Humidity",
                          icon: "assets/hygrometer.png",
                        ),
                        CircularIndicator(
                          indicatorColor: blue,
                          percent: 59 / 100,
                          amount: 59.toString(),
                          mark: "%",
                          title: "Clouds",
                          icon: "assets/cloud.png",
                        ),
                        CircularIndicator(
                          indicatorColor: green,
                          percent: 0.12,
                          amount: 1.5.toString(),
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
                  Padding(
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
                              temperatureRow(20),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "MAXIMUM",
                                textAlign: TextAlign.right,
                                style: kConstTextStyle,
                              ),
                              temperatureRow(30),
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
                              temperatureRow(20),
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
                                    "30",
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: Text(
                      "It's 🍦 time in San Jubail !",
                      // textAlign: TextAlign.right,
                      style: kConstTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: WaveClipperOne(),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                color: blue,
              ),
            ),
            Positioned(
              left: 80,
              top: -20,
              height: 200,
              width: 400,
              child: Image.asset(
                'assets/path1.png',
              ),
            ),
            Positioned(
              right: MediaQuery.of(context).size.width / 2 + 50,
              top: MediaQuery.of(context).size.height / 3 + 2,
              height: 150,
              width: 300,
              child: Image.asset(
                'assets/path2.png',
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.location_searching,
                          size: 30.0,
                          color: light,
                        ),
                      ),
                      FlatButton(
                        onPressed: () {},
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
                    'Jubail',
                    style: kBigTitleTextStyle,
                  ),
                  lineMarks(),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "weather condition",
                    //textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                  Text(
                    '32°',
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

  Row temperatureRow(int temperature) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temperature.toString(),
          textAlign: TextAlign.right,
          style: kNumberTextStyle,
        ),
        Text(
          "°",
          style: kNumberTextStyle,
        )
      ],
    );
  }

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
