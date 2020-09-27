
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission = await requestPermission();
    Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print( position );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();

          },
          child: Text('Get Location'),
        ),
      ),
    );
  }

}
