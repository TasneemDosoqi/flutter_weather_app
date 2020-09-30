
import 'package:geolocator/geolocator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

class Location {


  double latitude;
  double longitude;


  Future getCurrentLocation() async {
    try{
      LocationPermission permission = await requestPermission();
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      latitude = position.latitude;
      longitude = position.longitude;


    }catch (e){
      print(e);
      // Alert(
      //   //context: BuildContext(),
      //   title: "Something went wrong 🙁",
      //   desc: "unfortunately we are not able to get your location ‼️",
      //   buttons: [
      //     DialogButton(
      //       child: Text(
      //         "ok",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       ),
      //       onPressed: (
      //
      //           ) async {
      //         Navigator.pop(context);
      //       },
      //       width: 200,
      //     )
      //   ],
      // ).show();
    }
  }

}