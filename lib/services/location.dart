
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
    }
  }

}