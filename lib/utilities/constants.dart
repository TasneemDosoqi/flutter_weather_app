import 'package:flutter/material.dart';

//Defines styling for big title
const kBigTitleTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  color: Color(0xffFCFCFC),
  fontWeight: FontWeight.bold,
  fontSize: 50.0,
);

//Defines styling for small messages text
const kMessageTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Color(0xffFCFCFC),
);

//Defines styling for hint text
const kHintTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Color(0xff504FD3),
);

//Defines styling for input text
const kInputTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 20.0,
  color: Colors.black,
);

//Defines styling for numbers in the Circular indicators
const kConstTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w300,
  fontSize: 15.0,
  color: Colors.black,
);

//Defines styling for numbers
const kNumberTextStyle = TextStyle(
  fontFamily: 'PTSansCaption',
  fontWeight: FontWeight.w500,
  fontSize: 30.0,
  color: Colors.black,
);

// This function returns the shadow
BoxShadow containerShadow() {
  return BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    offset: Offset(0, 3),
    spreadRadius: 5,
    blurRadius: 7,
  );
}
