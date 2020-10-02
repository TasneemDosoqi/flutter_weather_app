import 'package:clima/utilities/colours.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/city_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: light,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    cityName = value;
                  },
                  style: kInputTextStyle,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: light,
                    prefixIcon: Icon(
                      Icons.search,
                      color: blue,
                      size: 30,
                    ),
                    hintText: 'Enter City Name',
                    hintStyle: kHintTextStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),

                  ),
                ),
              ),
              FlatButton(
                color: green,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Get Weather',
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
